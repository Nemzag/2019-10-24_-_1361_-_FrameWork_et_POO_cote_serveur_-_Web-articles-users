<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use App\Repository\PostRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;


class PostController extends AbstractController
{
	/**
	 * @Route("/", name="posts")
	 */
	// Injection de dépendance.
	public function viewPosts(PostRepository $repository)
	{
		/*
		// Code pro afficher que les visibles.
		$posts = $repository->findBy(
			['published' => true],
			['created' => 'DESC'] /*,
			5 // limit 5 *//*
		);
		return $this->render('post/index.html.twig', [
			'posts' => $posts
		]);
	}*/
		// Réécriture afin de voir les deux cas.
		$posts = $repository->findAll();
		return $this->render('post/index.html.twig', [
			'posts' => $posts
			]
		);
	}

    public function index()
    {
    	$posts = $this->getDoctrine()

		    ->getRepository(POST::class)
		    // ALT+ENTER sur POST pro l'importer.
		    // « :: » opérateur de résolution de portée :  Appeleur d'element dans la classe.

	        ->findAll();
    	    // Méthode qui remplace le SELECT * en S.Q.L.

        return $this->render('post/index.html.twig', [
        	'posts' => $posts
	        // Nom du paramètre, que l'on associe à la variable;
        ]);
    }

	// Le tiret peut aussi être remplacé par un slash, le nomenclature est libre.
	// Cela ne marchait pas car si on utilise WAMP64 ou Laragon,
	// il faut installer le Apache-pack / bundle.
	/**
	 * @Route("/article-{id}", name="onepost")
	 */
    public function onePost($id) // On place l'id afin d'afficher un seul article.
    {
		$post = $this->getDoctrine()
			->getRepository(Post::class)
			->find($id);
		// $post->getRepository(); on pourrait aussi faire cela.

	    // maintenant je fais mon renvoi de affichage.
	    return $this->render('post/detail.html.twig', [
		    'post' => $post
	        // Retour sous forme de tableau,
	        // la clé c'est la variable en twig que j'associe à ma variable PHP.
	    ]);
    }

    // http://localhost/Symfony4_-_2019/webarticles/public/newpost
    /**
     * @Route("/newpost", name="newpost")
     */
    public function newPost(Request $request) // alt+enter sur request.
	// on besoin de une classe request qui dans la HttpFoundation.
    // Request permet de recuperer les infos venant de l'exterieur (form).
	// Injection de dépendance.
	{
		$post = new Post();

		$form = $this->createForm(PostType::class, $post);
		// il va créé un formulaire sur base de la fonction que l'on a créé dans la classe à savoir $post.

		$form->handleRequest($request);

		// Verification & validation si les données sont correct.
		if($form->isSubmitted() && $form->isValid()) {

			// Em = Entity Manager
			$em = $this->getDoctrine()->getManager();

			// Persist & Flush
			$em->persist($post);
			// Memorise

			// envoi vers la base de donnée.
			$em->flush();
			// Ecrit dans la datha‑basë.

			// Message flahs
			$this->addFlash(
				'success',
				'Votre article à bien été ajouté'
			);

			// Retour vers l'index, dont le nom de route est "Posts".
			return $this->redirectToRoute('posts');
		}

		// En cas d'echec
		return $this->render('post/new.html.twig', [
			'post' => $post,
			'form' => $form->createView()
		]);
	}

	// Efface‑mênt.
	/**
	 * @Route("/del-{id}", name="delpost")
	 */
	public function delpost($id) {
		// Entity manager
		$em = $this->getDoctrine()->getManager();

		$repository = $this->getDoctrine()->getRepository(Post::class);
		// (Post::class) représente « Entity\Post.php »

		$post = $repository->find($id);
		$em->remove($post);
		$em->flush();

		$this->addFlash(
			'success',
			'Votre arθi‑kulë a bien été effacé.'
		);

		return $this->redirectToRoute('posts');
	}

	/**
	 * @Route("/edit-{id}", name="editpost")
	 */
	public function editPost(Request $request, Post $post) {
	// Injection de dépendance (la classe Post ne devra plus être instancié).

		$form = $this->createForm(PostType::class, $post);

		$form->handleRequest($request);

		if($form->isSubmitted() && $form->isValid()) {

			$em = $this->getDoctrine()->getManager();
			$em->flush();

			$this->addFlash(
				'success',
				'Votre article a bien été modifié.'
			);

			return $this->redirectToRoute('posts');
		}

		return $this->render('post/edit.html.twig', [
				'post' => $post,
				'form' => $form->createView()
			]);
	}

	/**
	 * @Route("/view-{id}", name="view")
	 */
	public function view(ObjectManager $em, PostRepository $repository, $id)
	// Injection de dépendance
	// Du faite de l'invocation de ObjetManager, c'est ligne sont superflue.
	{
		/*
		// Entity manager
		$em = $this->getDoctrine()->getManager();
		$repository = $this->getDoctrine()->getRepository(Post::class);
		// (Post::class) représente « Entity\Post.php »
		*/
		$post = $repository->find($id);
		// $post->setPublished(0);
		$post->getPublished() ? $post->setPublished(0) : $post->setPublished(1);
		$em->flush();

		$this->addFlash(
			'success',
			'Votre article a bien été caché.'
		);

		return $this->redirectToRoute('posts');
	}
}
