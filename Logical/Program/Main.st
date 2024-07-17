
PROGRAM _INIT
	(* Insert code here *)

	processParIdData.DataType := mcACPAX_PARTYPE_REAL;
	processParIdData.ParID := mcACPPAR_MOTOR_BRAKE_TORQ_RATED;
	processParIdData.VariableAddress := ADR(brakeRatedTrq);
		 
END_PROGRAM

PROGRAM _CYCLIC
	
	IF readMode THEN
		processParIdData.DataType := mcACPAX_PARTYPE_UINT;

		processParIdData.VariableAddress := ADR(brakeMode);
	ELSE
		processParIdData.DataType := mcACPAX_PARTYPE_REAL;
		processParIdData.ParID := mcACPPAR_MOTOR_BRAKE_TORQ_RATED;
		processParIdData.VariableAddress := ADR(brakeRatedTrq);
	END_IF
	
	MpAxisBasic_0(MpLink := ADR(gAxisMaster), Enable := TRUE, Parameters := ADR(AxisPar));
	MpAxisBasic_1(MpLink := ADR(gAxisSlave), Enable := TRUE, Parameters := ADR(AxisPar));	
 
	
	MC_BR_ProcessParID_AcpAx_0(Axis := ADR(gAxisMaster));
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

