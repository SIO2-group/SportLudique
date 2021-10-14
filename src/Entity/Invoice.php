<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Invoice
 *
 * @ORM\Table(name="invoice", indexes={@ORM\Index(name="I_FK_INVOICE_STATUS", columns={"ID_STATUS"})})
 * @ORM\Entity
 */
class Invoice
{
    /**
     * @var int
     *
     * @ORM\Column(name="ID_INVOICE", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idInvoice;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="PAY_DATE", type="date", nullable=true)
     */
    private $payDate;

    /**
     * @var \Status
     *
     * @ORM\ManyToOne(targetEntity="Status")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ID_STATUS", referencedColumnName="ID_STATUS")
     * })
     */
    private $idStatus;

    public function getIdInvoice(): ?int
    {
        return $this->idInvoice;
    }

    public function getPayDate(): ?\DateTimeInterface
    {
        return $this->payDate;
    }

    public function setPayDate(?\DateTimeInterface $payDate): self
    {
        $this->payDate = $payDate;

        return $this;
    }

    public function getIdStatus(): ?Status
    {
        return $this->idStatus;
    }

    public function setIdStatus(?Status $idStatus): self
    {
        $this->idStatus = $idStatus;

        return $this;
    }


}
