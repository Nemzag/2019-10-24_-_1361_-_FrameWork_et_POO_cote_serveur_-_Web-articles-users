<?php

namespace App\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PostType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
	        // On invoque l'attibut de la classe et le type.
            ->add('title', TextType::class)
	        /* nom attribut : title, label permet de specifier plus précisémênt le titre. */
            ->add('content', TextareaType::class)
            ->add('created', DateType::class, [
            	'label' => 'Date de création',
	            'data' => new \DateTime(),
	            /* permet que le formulaire indique la date du jour */
	            'format' => 'dd MM yyyy'
            ])
	        // Il nous manque un add pour lister les catégories.
	        ->add('category', EntityType::class, [
	        	'class' => 'App:Category',
		        'choice_label' => 'category'
	        ])

            ->add('image', TextType::class, [
            	// tableau de option.
	            'required' => false, // Obligatorie : non.
	            'empty_data' => 'default.png'
            ])
            ->add('published', ChoiceType::class, [
            	'choices' => [
                // tableau associatif
		            'Oui' => 1,
		            'Non' => 0
	            ]

            ]) // liste déroulante.
	        ->add('submit', SubmitType::class);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
