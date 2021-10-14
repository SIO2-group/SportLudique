<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Article
 *
 * @ORM\Table(name="article", indexes={@ORM\Index(name="I_FK_ARTICLE_BRAND", columns={"ID_BRAND"}), @ORM\Index(name="I_FK_ARTICLE_CATEGORIE", columns={"ID_CATEGORIE"})})
 * @ORM\Entity
 */
class Article
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_ARTICLE", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idArticle;

    /**
     * @var string
     *
     * @ORM\Column(name="NAME", type="string", length=128, nullable=false)
     */
    private $name;

    /**
     * @var int|null
     *
     * @ORM\Column(name="PRICE", type="integer", nullable=true)
     */
    private $price;

    /**
     * @var int|null
     *
     * @ORM\Column(name="QUANTITY", type="integer", nullable=true)
     */
    private $quantity;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="IS_ACTIVE", type="boolean", nullable=true)
     */
    private $isActive;

    /**
     * @var \Categorie
     *
     * @ORM\ManyToOne(targetEntity="Categorie")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_CATEGORIE", referencedColumnName="ID_CATEGORIE")
     * })
     */
    private $idCategorie;

    /**
     * @var \Brand
     *
     * @ORM\ManyToOne(targetEntity="Brand")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_BRAND", referencedColumnName="ID_BRAND")
     * })
     */
    private $idBrand;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="User", inversedBy="idArticle")
     * @ORM\JoinTable(name="review",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ID_ARTICLE", referencedColumnName="ID_ARTICLE")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ID_USER", referencedColumnName="ID_USER")
     *   }
     * )
     */
    private $idUser;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idUser = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdArticle(): ?int
    {
        return $this->idArticle;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(?int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(?int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getIsActive(): ?bool
    {
        return $this->isActive;
    }

    public function setIsActive(?bool $isActive): self
    {
        $this->isActive = $isActive;

        return $this;
    }

    public function getIdCategorie(): ?Categorie
    {
        return $this->idCategorie;
    }

    public function setIdCategorie(?Categorie $idCategorie): self
    {
        $this->idCategorie = $idCategorie;

        return $this;
    }

    public function getIdBrand(): ?Brand
    {
        return $this->idBrand;
    }

    public function setIdBrand(?Brand $idBrand): self
    {
        $this->idBrand = $idBrand;

        return $this;
    }

    /**
     * @return Collection|User[]
     */
    public function getIdUser(): Collection
    {
        return $this->idUser;
    }

    public function addIdUser(User $idUser): self
    {
        if (!$this->idUser->contains($idUser)) {
            $this->idUser[] = $idUser;
        }

        return $this;
    }

    public function removeIdUser(User $idUser): self
    {
        $this->idUser->removeElement($idUser);

        return $this;
    }

}
