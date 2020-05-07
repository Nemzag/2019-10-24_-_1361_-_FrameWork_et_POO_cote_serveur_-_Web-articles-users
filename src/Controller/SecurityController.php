<?php
/*
 * php bin/console make:controller
 * Choose a name for your controller class (e.g. FierceJellybeanController):
 * > SecurityController
 */

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class SecurityController extends AbstractController
{
	/**
	 * @Route("/registration", name="registration")
	 * @param Request $request
	 * @param ObjectManager $em
	 * @param UserPasswordEncoderInterface $encoder
	 * @return Response
	 */
    public function registration(Request $request, ObjectManager $em, UserPasswordEncoderInterface $encoder)
    // Renommage de index en registration.
    {
		$user = new User();
        $form = $this->createForm(RegistrationType::class, $user);

        // Recuperation des données.
	    $form->handleRequest($request);

		// Verification du formulaire.
	    if($form->isSubmitted() && $form->isValid()) {

			$hash = $encoder->encodePassword($user, $user->getPassword());

			$user->setPassword($hash);

			$em->persist($user);

			$em->flush();

			return $this->redirectToRoute('posts');
	    }
	    return $this->render('security/registration.html.twig', [
	    	'user' => $user,
	    	'form' => $form->createView()
	    ]);
    }

    /**
     * @Route("/login", name="login")
     */
    public function login() // Obligatoirement login.
    {
    	return $this->render('security/login.html.twig');
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logout() {

    	// Comme on écrit path / target dans la ligne logout dans security.yaml,
	    // on doit rien ajouter ici.
    }
}
