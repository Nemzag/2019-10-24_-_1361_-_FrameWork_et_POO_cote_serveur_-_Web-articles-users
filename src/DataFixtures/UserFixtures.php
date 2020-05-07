<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker\Factory;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
	// On a besoin de un constrcuteur.
	public function __construct(UserPasswordEncoderInterface $encoder) // On a besoin de l'objet $encoder.
	{
		$this->encoder = $encoder;
		// Maintenant on peut utiliser le cryptage.
	}

	public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

	    $faker = Factory::create('fr_FR');
	    // on appelle un objet, c'est du statique.

	    // Ecrire la boucle.
	    for($i = 1 ; $i <= 30 ; $i++) {

	    	// Il faut instancier
		    $user = new User(); // ALT+ENTER sur USER pour importer classe.
		    $user->setFirstName($faker->firstName); //quand on utilise pash faker : setFirstName('User_'.$i);
		    $user->setLastName($faker->lastName);
		    $user->setUserName($user->getFirstName().$user->getLastName()); // La on fait une concatenation pash du faker.
		    $user->setEmail($user->getUserName().'@domain.ext');
		    $password = $this->encoder->encodePassword($user, 'password');
		    $user->setPassword($password);

		    $manager->persist($user);
	    }

        $manager->flush();
    }


}
