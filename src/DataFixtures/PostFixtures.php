<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Faker\Factory;
use App\Entity\Post;

class PostFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    // Injection de dépendance récupère la méthode getDoctrine.
    {
        // $product = new Product();

	    $faker = Factory::create('fr_FR');

	    // On a besoin de toute les categories.
	    // Utilisation de repository des categories pour invoquer la méthode findAll.
	    $categories = $manager->getRepository(Category::class)->findAll();
	    // Comme j'utilise ObjectManager, je ne dois pash invoquer getDoctrine
		$users = $manager->getRepository(User::class)->findAll();

	    for($i = 1; $i <= 20; $i++) {
	    	$post = new Post();
	    	$post->setTitle($faker->sentence(4, true));
	    	$post->setContent($faker->paragraphs(3, true));
	    	$post->setCreated($faker->dateTimeThisYear('now'));
	    	$post->setImage($i.'.png');
	    	$post->setPublished(1);
	    	$post->setCategory($categories[$faker->numberBetween(0, count($categories) - 1)]);
		    // nombre aleatoire à générer. Moins 1 car dans la d
			$post->setUser($users[$faker->numberBetween(0, count($users) - 1)]); // Offset

	    	$manager->persist($post);
	    }

        // $manager->persist($product);

        $manager->flush();
    }
    // Ce nom est obligatorie et proposé car j'utilise une interface.
    public function getDependencies()
    {
	    // TODO: Implement getDependencies() method.
	    return [
	    	CategoryFixtures::class,
		    UserFixtures::class
	    ];
    }
}
