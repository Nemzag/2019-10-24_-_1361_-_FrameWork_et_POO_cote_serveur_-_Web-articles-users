<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert; // Assert est un alias.

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @UniqueEntity(
 *     "userName",
 *     message="Nom de utilisateur déjà pris."
 * )
 * @UniqueEntity(
 *     "email",
 *     message="E‑mail déjà pris.")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=120)
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=120)
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=120)
     */
    private $userName;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    // On va vérifier des condition d'acceptation dans un champs.
	// Avec @Assert et une propriété Length
    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\Length(
     *     min = 4,
     *     minMessage = "Le mot de passe doit contenir au minimum {{ limit }} caractères."
     * )
     */
    private $password;

	// Ajouté manu‑êlle‑mênt suite à la modification de Form\RegistrationType.php
	/**
	 * @Assert\EqualTo(
	 *     propertyPath="password",
	 *     message="Le mot de passe doit‑être identique."
	 * )
	 */
	public $confirmPassword;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Post", mappedBy="user")
     */
    private $posts;

    public function __construct()
    {
        $this->posts = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

	public function getFirstName(): ?string
	{
		return $this->firstName;
	}

    public function setFirstName(string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getUserName(): ?string
    {
        return $this->userName;
    }

    public function setUserName(string $userName): self
    {
        $this->userName = $userName;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @return Collection|Post[]
     */
    public function getPosts(): Collection
    {
        return $this->posts;
    }

    public function addPost(Post $post): self
    {
        if (!$this->posts->contains($post)) {
            $this->posts[] = $post;
            $post->setUser($this);
        }

        return $this;
    }

    public function removePost(Post $post): self
    {
        if ($this->posts->contains($post)) {
            $this->posts->removeElement($post);
            // set the owning side to null (unless already changed)
            if ($post->getUser() === $this) {
                $post->setUser(null);
            }
        }

        return $this;
    }

	/**
	 * Returns the roles granted to the user.
	 *
	 *     public function getRoles()
	 *     {
	 *         return ['ROLE_USER'];
	 *     }
	 *
	 * Alternatively, the roles might be stored on a ``roles`` property,
	 * and populated in any number of different ways when the user object
	 * is created.
	 *
	 * @return (Role|string)[] The user roles
	 */
	public function getRoles()
	{
		// TODO: Implement getRoles() method.
		return ['ROLE_USER']; // Type array.
	}

	/**
	 * Returns the salt that was originally used to encode the password.
	 *
	 * This can return null if the password was not encoded using a salt.
	 *
	 * @return string|null The salt
	 */
	public function getSalt()
	{
		// TODO: Implement getSalt() method.
	}

	/**
	 * Removes sensitive data from the user.
	 *
	 * This is important if, at any given point, sensitive information like
	 * the plain-text password is stored on this object.
	 */
	public function eraseCredentials()
	{
		// TODO: Implement eraseCredentials() method.
	}


}
