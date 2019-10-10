<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
// Ajouté
use App\Entity\Category;

class CategoryFixtures extends Fixture
{
	// Je veux générer quelque chose de correct.
	private $categories = ['PHP', 'Symfony', 'Laravel', 'Back End', 'Security', 'Front End', 'Python'];

    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

	    foreach($this->categories as $cat) {

	    	// Il va falloir créer des objets.
		    $category = new Category();

		    $category->setCategory($cat);

		    $manager->persist($category);
	    }

        $manager->flush();
    }
}
