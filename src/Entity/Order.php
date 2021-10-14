<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Order
 *
 * @ORM\Table(name="order", indexes={@ORM\Index(name="I_FK_ORDER_ARTICLE", columns={"ID_ARTICLE"}), @ORM\Index(name="I_FK_ORDER_INVOICE", columns={"ID_INVOICE"}), @ORM\Index(name="I_FK_ORDER_USER", columns={"ID_USER"})})
 * @ORM\Entity
 */
class Order
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="STATUS", type="string", length=128, nullable=true)
     */
    private $status;

    /**
     * @var \Invoice
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="Invoice")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_INVOICE", referencedColumnName="ID_INVOICE")
     * })
     */
    private $idInvoice;

    /**
     * @var \Article
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="Article")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_ARTICLE", referencedColumnName="ID_ARTICLE")
     * })
     */
    private $idArticle;

    /**
     * @var \User
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_USER", referencedColumnName="ID_USER")
     * })
     */
    private $idUser;

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getIdInvoice(): ?Invoice
    {
        return $this->idInvoice;
    }

    public function setIdInvoice(?Invoice $idInvoice): self
    {
        $this->idInvoice = $idInvoice;

        return $this;
    }

    public function getIdArticle(): ?Article
    {
        return $this->idArticle;
    }

    public function setIdArticle(?Article $idArticle): self
    {
        $this->idArticle = $idArticle;

        return $this;
    }

    public function getIdUser(): ?User
    {
        return $this->idUser;
    }

    public function setIdUser(?User $idUser): self
    {
        $this->idUser = $idUser;

        return $this;
    }


}
