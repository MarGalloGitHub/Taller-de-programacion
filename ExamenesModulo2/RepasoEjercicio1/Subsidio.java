/*
De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.

Un subsidio sólo debería poder construirse con el monto pedido y el motivo. 
Un subsidio siempre se crea en estado no-otorgado.
 */
package RepasoEjercicio1;

/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double montoPedido;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double montoPedido, String motivo) {
        this.montoPedido = montoPedido;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
    
}
