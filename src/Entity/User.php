<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * User
 *
 * @ORM\Table(name="user")
 * @ORM\Entity
 */
class User
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_USER", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idUser;

    /**
     * @var string|null
     *
     * @ORM\Column(name="LAST_NAME", type="string", length=128, nullable=true)
     */
    private $lastName;

    /**
     * @var string|null
     *
     * @ORM\Column(name="FIRST_NAME", type="string", length=128, nullable=true)
     */
    private $firstName;

    /**
     * @var string|null
     *
     * @ORM\Column(name="EMAIL", type="string", length=128, nullable=true)
     */
    private $email;

    /**
     * @var json|null
     *
     * @ORM\Column(name="ROLES", type="json", nullable=true)
     */
    private $roles;

    /**
     * @var string|null
     *
     * @ORM\Column(name="PASSWORD", type="string", length=128, nullable=true)
     */
    private $password;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Article", mappedBy="idUser")
     */
    private $idArticle;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idArticle = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdUser(): ?int
    {
        return $this->idUser;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(?string $lastName): self
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(?string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getRoles(): ?array
    {
        return $this->roles;
    }

    public function setRoles(?array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(?string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @return Collection|Article[]
     */
    public function getIdArticle(): Collection
    {
        return $this->idArticle;
    }

    public function addIdArticle(Article $idArticle): self
    {
        if (!$this->idArticle->contains($idArticle)) {
            $this->idArticle[] = $idArticle;
            $idArticle->addIdUser($this);
        }

        return $this;
    }

    public function removeIdArticle(Article $idArticle): self
    {
        if ($this->idArticle->removeElement($idArticle)) {
            $idArticle->removeIdUser($this);
        }

        return $this;
    }

}
