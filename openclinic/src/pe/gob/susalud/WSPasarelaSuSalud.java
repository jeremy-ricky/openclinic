
package pe.gob.susalud;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.4-b01
 * Generated source version: 2.2
 * 
 */
@WebService(name = "WSPasarelaSuSalud", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/")
@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
@XmlSeeAlso({
    ObjectFactory.class
})
public interface WSPasarelaSuSalud {


    /**
     * 
     * @param getConsultaAsegNomRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaAsegNomResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaAsegNom")
    @WebResult(name = "getConsultaAsegNomResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaAsegNomResponse")
    public GetConsultaAsegNomResponse getConsultaAsegNom(
        @WebParam(name = "getConsultaAsegNomRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaAsegNomRequest")
        GetConsultaAsegNomRequest getConsultaAsegNomRequest);

    /**
     * 
     * @param getConsultaAsegCodRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaAsegCodResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaAsegCod")
    @WebResult(name = "getConsultaAsegCodResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaAsegCodResponse")
    public GetConsultaAsegCodResponse getConsultaAsegCod(
        @WebParam(name = "getConsultaAsegCodRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaAsegCodRequest")
        GetConsultaAsegCodRequest getConsultaAsegCodRequest);

    /**
     * 
     * @param getConsultaDatosAdiRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaDatosAdiResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaDatosAdi")
    @WebResult(name = "getConsultaDatosAdiResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaDatosAdiResponse")
    public GetConsultaDatosAdiResponse getConsultaDatosAdi(
        @WebParam(name = "getConsultaDatosAdiRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaDatosAdiRequest")
        GetConsultaDatosAdiRequest getConsultaDatosAdiRequest);

    /**
     * 
     * @param getConsultaDerivaRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaDerivaResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaDeriva")
    @WebResult(name = "getConsultaDerivaResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaDerivaRequest")
    public GetConsultaDerivaResponse getConsultaDeriva(
        @WebParam(name = "getConsultaDerivaRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaDerivaRequest")
        GetConsultaDerivaRequest getConsultaDerivaRequest);

    /**
     * 
     * @param getCondicionMedicaRequest
     * @return
     *     returns pe.gob.susalud.GetCondicionMedicaResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getCondicionMedica")
    @WebResult(name = "getCondicionMedicaResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getCondicionMedicaResponse")
    public GetCondicionMedicaResponse getCondicionMedica(
        @WebParam(name = "getCondicionMedicaRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getCondicionMedicaRequest")
        GetCondicionMedicaRequest getCondicionMedicaRequest);

    /**
     * 
     * @param getConsultaObservacionRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaObservacionResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaObservacion")
    @WebResult(name = "getConsultaObservacionResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaObservacionResponse")
    public GetConsultaObservacionResponse getConsultaObservacion(
        @WebParam(name = "getConsultaObservacionRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaObservacionRequest")
        GetConsultaObservacionRequest getConsultaObservacionRequest);

    /**
     * 
     * @param getConsultaSCTRRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaSCTRResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaSCTR")
    @WebResult(name = "getConsultaSCTRResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaSCTRResponse")
    public GetConsultaSCTRResponse getConsultaSCTR(
        @WebParam(name = "getConsultaSCTRRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaSCTRRequest")
        GetConsultaSCTRRequest getConsultaSCTRRequest);

    /**
     * 
     * @param getConsultaxCartaGarantiaRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaxCartaGarantiaResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaxCartaGarantia")
    @WebResult(name = "getConsultaxCartaGarantiaResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaxCartaGarantiaResponse")
    public GetConsultaxCartaGarantiaResponse getConsultaxCartaGarantia(
        @WebParam(name = "getConsultaxCartaGarantiaRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaxCartaGarantiaRequest")
        GetConsultaxCartaGarantiaRequest getConsultaxCartaGarantiaRequest);

    /**
     * 
     * @param getNumAutorizacionRequest
     * @return
     *     returns pe.gob.susalud.GetNumAutorizacionResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getNumAutorizacion")
    @WebResult(name = "getNumAutorizacionResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getNumAutorizacionResponse")
    public GetNumAutorizacionResponse getNumAutorizacion(
        @WebParam(name = "getNumAutorizacionRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getNumAutorizacionRequest")
        GetNumAutorizacionRequest getNumAutorizacionRequest);

    /**
     * 
     * @param getConsultaEntVinculadaRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaEntVinculadaResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaEntVinculada")
    @WebResult(name = "getConsultaEntVinculadaResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaEntVinculadaResponse")
    public GetConsultaEntVinculadaResponse getConsultaEntVinculada(
        @WebParam(name = "getConsultaEntVinculadaRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaEntVinculadaRequest")
        GetConsultaEntVinculadaRequest getConsultaEntVinculadaRequest);

    /**
     * 
     * @param getConsultaProcRequest
     * @return
     *     returns pe.gob.susalud.GetConsultaProcResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getConsultaProc")
    @WebResult(name = "getConsultaProcResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaProcResponse")
    public GetConsultaProcResponse getConsultaProc(
        @WebParam(name = "getConsultaProcRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getConsultaProcRequest")
        GetConsultaProcRequest getConsultaProcRequest);

    /**
     * 
     * @param getRegistroDecAccidenteRequest
     * @return
     *     returns pe.gob.susalud.GetRegistroDecAccidenteResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getRegistroDecAccidente")
    @WebResult(name = "getRegistroDecAccidenteResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getRegistroDecAccidenteResponse")
    public GetRegistroDecAccidenteResponse getRegistroDecAccidente(
        @WebParam(name = "getRegistroDecAccidenteRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getRegistroDecAccidenteRequest")
        GetRegistroDecAccidenteRequest getRegistroDecAccidenteRequest);

    /**
     * 
     * @param getFotoRequest
     * @return
     *     returns pe.gob.susalud.GetFotoResponse
     */
    @WebMethod(action = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/getFoto")
    @WebResult(name = "getFotoResponse", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getFotoResponse")
    public GetFotoResponse getFoto(
        @WebParam(name = "getFotoRequest", targetNamespace = "http://www.susalud.gob.pe/acreditacion/WSPasarelaSuSalud/", partName = "getFotoRequest")
        GetFotoRequest getFotoRequest);

}
