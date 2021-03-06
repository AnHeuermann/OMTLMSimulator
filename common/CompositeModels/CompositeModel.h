//!
//!  \file CompositeModel.h
//! 
//! Defines the classes used for CompositeModel representation on Manager
//!
#ifndef CompositeModel_h_
#define CompositeModel_h_

#include <vector>
#include <cstdio>
#include <string>
#include <ios>

#include "Communication/TLMCommUtil.h"
#include "Logging/TLMErrorLog.h"
#include "Interfaces/TLMInterface.h"

// Classes defined later in this file
class TLMComponentProxy;
class TLMInterfaceProxy;
class ComponentParameterProxy;
class TLMConnection;
class SimulationParams;

// Type synonims for the arrays of CompositeModel parts.
//! ComponentsVector is an array of components as stored in CompositeModel on the TLM manager
typedef std::vector<TLMComponentProxy*> ComponentsVector;

//!  TLMInterfacesVector is an array of TLMInterfaceProxy as stored in CompositeModel on the TLM manager
typedef std::vector<TLMInterfaceProxy*> TLMInterfacesVector;

//!  ComponentParametersVector is an array of ComponentParameterProxy as stored in CompositeModel on the TLM manager
typedef std::vector<ComponentParameterProxy*> ComponentParametersVector;

//!  ConnectionsVector is an array of components as stored in CompositeModel on the TLM manager
typedef std::vector<TLMConnection*> ConnectionsVector;

//! TLMInterfaceProxy class represents a part of the CompositeModel and resides in the server.
//! TLM Manager operates in terms of InterfaceProxies. Proxy becomes connected
//! when the corresponding component sends a registration message.
class  TLMInterfaceProxy {

public:

    //! Constructor.
    //! Input:
    //! aCompID - comonent ID of the owner
    //! IfcID - ID of this interface
    //! aName - name of this interface
    TLMInterfaceProxy(int CompID, int IfcID, std::string& aName, int aDimensions=6,
                      std::string aCausality="bidirectional", std::string aDomain="mechanical");

    //! Get the name of this interface
    const std::string& GetName() const {
        return Name;
    }

    //! Get the dimensions of this interface
    const int GetDimensions() const {
        return Dimensions;
    }

    //! Get the causality of this interface
    const std::string GetCausality() const {
        return Causality;
    }

    //! Get the domain of this interface
    const std::string GetDomain() const {
        return Domain;
    }

    //! Get ID of the interface
    int GetID() const {
        return InterfaceID;
    }

    //! Get ID of the owner component
    int GetComponentID() {
        return ComponentID;
    }

    //! Get ID of the interface connected to this one with TLMConnection
    //! Returns '-1' if it is not connected
    int GetLinkedID() const {
        return LinkedID;
    }

    //! Get the ID of Connection object attached to this interface.
    //! Returns '-1' if no connection is attached.
    int GetConnectionID() const {
        return ConnectionID;
    }

    //! Set the connection object attached to this interface.
    void SetConnection(TLMConnection& conn);

    //! Set 'connected' flag, meaning that the Proxy is connected to the
    //! simulating compontent.
    void SetConnected() {
        Connected = true;
    }

    //! Read the Connected flag. Returns 'true' if the proxy is connected
    //! to a simulating component.
    bool GetConnected() const {
        return Connected;
    }

    //    TLMTimeDataSignal& getTime0DataSignal() {
    //        return time0DataSignal;
    //    }

    //    TLMTimeData1D& getTime0Data1D() {
    //        return time0Data1D;
    //    }

    //! Access data for simulation start time.
    TLMTimeData3D& getTime0Data3D() {
        return time0Data3D;
    }

private:

    //! Set the interface connected to this one with TLMConnection
    void SetLinkedID(int ID) {
        LinkedID = ID;
    }

    //! ID of this interface
    int InterfaceID;

    //! ID of the owner component
    int ComponentID;

    //! ID of the TLMConnection attached to the interface, -1 if not attached
    int ConnectionID;

    //! ID of the TLM interface that is connected to this one via TLM Connection
    int LinkedID;

    //! Name of the interface within the Component
    std::string Name;

    //! Type of the interface
    int Dimensions;

    //! Causality of the interface
    std::string Causality;

    //! Physical domain of the interface
    std::string Domain;

    //! Flag telling if the simulating component is connected to the proxy.
    bool Connected;

    //! Data at simulation start time.
    //! Used for data interface data request mode.
    //    TLMTimeData3D time0DataSignal;
    //    TLMTimeData3D time0Data1D;
    TLMTimeData3D time0Data3D;
};



class  ComponentParameterProxy {

public:

    ComponentParameterProxy(int CompID, int ParID, std::string& aName, std::string& aDefaultValue);

    //! Get the name of this interface
    const std::string& GetName() const {
        return Name;
    }

    //! Get the dimensions of this interface
    const std::string& GetValue() const {
        return Value;
    }

    //! Get ID of the parameter
    int GetID() const {
        return ParameterID;
    }

    //! Get ID of the owner component
    int GetComponentID() {
        return ComponentID;
    }

    void SetValue(std::string& aValue) {
        Value = aValue;
    }

private:
    //! ID of this parameter
    int ParameterID;

    //! ID of the owner component
    int ComponentID;

    //! Name of the interface within the Component
    std::string Name;

    //! Value of the parameter
    std::string Value;
};


//! Component proxy stores information related to a TLM client 
//! on the manager. 
class TLMComponentProxy {

    //! Name of the component in the Meta model
    std::string Name;

    //! The command used to start the component
    std::string StartCommand;

    //! The name of the simulation model, typically the input file base-name
    std::string ModelName;

    //! solver mode used in the component (Exact time equidistant steps supported)
    bool SolverMode;

    std::string GeometryFile;

    //! socket used to communicate between proxy and the component on the Client
    int SocketHandle;

    //! This flag indicates that the component done sending "RegInterface"
    //! requests and is ready run the simualtion.
    bool ReadyToSim;

    //! This is the location of the components local inertial system $cX$,
    //! relative to the meta-model inertial system $cG$. Coordinates are
    //! expressed  in the meta-models inertia system $cG$.
    double cX_R_cG_cG[3];
    
    //! This is transformation matrix that represents the orientation of
    //! the component coordinate system (cX) relative the global coordinate
    //! system (cG).
    double cX_A_cG[9];

public:

    //! Constructor.
    //! \param aName - component name in the CompositeModel
    //! \param aStartCommand - script used to start the component
    //! \param aSolverMode - solver mode of the component (exact time equidistant steps supported)
    TLMComponentProxy(const std::string& aName,
                      const std::string& aStartCommand,
                      const std::string& aModelName,
                      bool aSolverMode,
                      const std::string& aGeometryFile):
        Name(aName),
        StartCommand(aStartCommand),
        ModelName(aModelName),
        SolverMode(aSolverMode),
        GeometryFile(aGeometryFile),
        SocketHandle(-1),
        ReadyToSim(false)
      //cX_R_cG_cG,
      //cX_A_cG
    {
        cX_R_cG_cG[0] = 0.0;
        cX_R_cG_cG[1] = 0.0;
        cX_R_cG_cG[2] = 0.0;

        cX_A_cG[0] = 1.0;
        cX_A_cG[1] = 0.0;
        cX_A_cG[2] = 0.0;

        cX_A_cG[3] = 0.0;
        cX_A_cG[4] = 1.0;
        cX_A_cG[5] = 0.0;

        cX_A_cG[6] = 0.0;
        cX_A_cG[7] = 0.0;
        cX_A_cG[8] = 1.0;
    }

    //! read the Name
    std::string& GetName() {
        return Name;
    }

    //! read the start command
    std::string& GetStartCommand() {
        return StartCommand;
    }

    //! read the model file
    std::string& GetModelFile() {
        return ModelName;
    }

    //! Start the component executable
    void StartComponent(SimulationParams& SimParams, double MaxStep);

    //! SetSocketHandle assigns a socket handle used for communications with the component.
    void SetSocketHandle(int hdl) {
        if((SocketHandle != -1)  && (hdl != -1)) {
            TLMErrorLog::FatalError(std::string("Component ") +  Name + " is already connected");
        }
        SocketHandle = hdl;
    }

    //! GetSocketHandle returns the SocketHandle for the socket associated with the Component
    int GetSocketHandle() const {
        return SocketHandle;
    }
    
    //! SetReadyToSim sets the ReadyToSim flag when all the TLM interfaces of this component
    //! are connected and the Component is running simulation.
    void SetReadyToSim() {
        ReadyToSim = true;
    }

    //! GetReadyToSim returns ReadyToSim flag
    bool GetReadyToSim() const {
        return ReadyToSim;
    }

    //! GetSolverMode returns the Solver mode for the component (if the solver can take time
    //! equidistant steps or not)
    bool GetSolverMode() const {
        return SolverMode;
    }

    std::string& GetGeometryFile() {
        return GeometryFile;
    }

    //! Set position and orientation of the component inertial system relative the
    //! meta-models inertial system.
    void SetInertialTranformation(double pos[], double orientation[]);

    //! Get position and orientation of the component inertial system relative the
    //! meta-models inertial system.
    void GetInertialTranformation(double pos[3], double orientation[9]);
    
};

//! TLMConnection class stores information about a TLM link
//! between two TLM interfaces.
class TLMConnection {

    //! ID of this connection
    int ID;

    //! ID of the TLMInterface-s connected by this connection
    int FromID, ToID;

    //! Parameters of this connection
    TLMConnectionParams Param;


public:
    
    //! Constructor
    //! \param thisID ID for this connection
    //! \param ID1 interface ID for the first TLM interface
    //! \param ID2 interface ID for the second TLM interface
    //! \param  param parameters of this connection
    TLMConnection(int thisID, int ID1, int ID2, TLMConnectionParams& param):
        ID(thisID),
        FromID(ID1),
        ToID(ID2),
        Param(param)
    {
    }
    
    //! Get ID of this connection object
    int GetID() const { return ID; }

    //! ID of one of the connected interfaces
    int GetFromID() const {
        return FromID;
    }

    //! ID of one of the connected interfaces
    int GetToID() const {
        return ToID;
    }

    //! Get parameters for this connection
    TLMConnectionParams& GetParams() {
        return Param;
    }

};

//! SimulationParams class keeps the parameters for a simulation
//! that are used to start client executables.
class SimulationParams {    
    //! Start time for a simulation
    double TimeStart;

    //! End time for a simulation
    double TimeEnd;

    //! Optional write time step that can be used by logging/monitoring processes.
    //! Defaults is (TimeEnd-TimeStart)/1000.0
    double WriteTimeStep;

    std::string Address;

    //! Port where the server is listening
    int Port;

    //! Monitoring port to which the server forwards
    //! all messages.
    int MonitorPort;

    //! Connection timeout in seconds used by server
    int Timeout;

public:

    //! Constructor
    SimulationParams() {
        Set("127.0.0.1", 11111, 0.0, 1.0, 12111);
    }

    //! Set method assign the attributes of the object
    void Set(std::string address, int aPort, double StartTime, double StopTime, int aTimeout = 600, int aMonitorPort = -1) {
        Address = address;
        Port = aPort;
        TimeStart = StartTime;
        TimeEnd = StopTime;
        WriteTimeStep = (TimeEnd-TimeStart)/1000.0;
        Timeout = aTimeout;
        MonitorPort = aMonitorPort;
    }

    //! Get the port number
    int GetPort() const {
        return Port;
    }

    void SetAddress(std::string address) {
        Address = address;
    }

    //! Set the port number
    void SetPort(int aPort) {
        Port = aPort;
    }

    //! Get the monitor port number
    int GetMonitorPort() const {
        return MonitorPort;
    }

    //! Set the monitor port number
    void SetMonitorPort(int aPort) {
        MonitorPort = aPort;
    }

    //! Set simulation start time
    void SetStartTime(double StartTime) {
        TimeStart = StartTime;
    }

    //! Get simulation start time
    double GetStartTime() const {
        return TimeStart;
    }

    //! Start time as a string
    std::string GetStartTimeStr() const {
        char Buf[50];
        sprintf(Buf, "%g", TimeStart);
        return std::string(Buf);
    }

    //! Set simulation end time
    void SetEndTime(double EndTime) {
        TimeEnd = EndTime;
    }

    //! Get simulation end time
    double GetEndTime() const {
        return TimeEnd;
    }

    //! End time as string
    std::string GetEndTimeStr() const {
        char Buf[50];
        sprintf(Buf, "%g", TimeEnd);
        return std::string(Buf);
    }

    //! Get server name & port number in the form \<server>:\<port>
    std::string GetServerName() const;

    //! Returns communication timeout in seconds.
    int GetTimeout() { return Timeout; }

    //! Returns write time step.
    double GetWriteTimeStep() { return WriteTimeStep; }

    //! Set write time step.
    void SetWriteTimeStep(double wts) { WriteTimeStep = wts; }

};

//! Class CompositeModel

//! The class is responsible for the dynamic storage and access to the
//! meta-model.
class omtlm_CompositeModel {

    //! MOdel name
    std::string ModelName;

    //! Array of ComponentProxies keeping track of the TLMComponents in the model
    ComponentsVector Components;

    //! Array of InterfaceProxies keeping tract of the TLMInterfaces in the model
    TLMInterfacesVector Interfaces;

    //! Array of ComponentParameterProxies keeping track of the ComponentParameters in the model
    ComponentParametersVector ComponentParameters;

    //! Array of TLMConnections. The essential part of meta-model.
    ConnectionsVector Connections;

    //! Simulation parameters
    SimulationParams SimParams;

public:
    
    //! Constructor
    omtlm_CompositeModel();

    //! Destructor
    ~omtlm_CompositeModel();

    bool CheckTheModel();

    //! Add ComponentProxy to the model and return its ID.
    int RegisterTLMComponentProxy(const std::string& Name,
                                  const std::string& StartCommand,
                                  const std::string& ModelName,
                                  int SolverMode,
                                  const std::string& GeometryFile);

    //! Return model name
    std::string GetModelName() {
        return ModelName;
    }

    //! Set model name
    void SetModelName(std::string name) {
      ModelName = name;
    }

    //! Return ComponentProxy for the specified ID.
    TLMComponentProxy& GetTLMComponentProxy(const int ID) {
        return *(Components[ID]);
    }

    //! Return the number of registered components.
    int GetComponentsNum() const  {
        return static_cast<int>(Components.size());
    }

    //! Return the number of registered components.
    size_t GetInterfacesNum() const  {
        return Interfaces.size();
    }

    size_t GetComponentParametersNum() const { return ComponentParameters.size(); }

    //! Find a Component by its name and return the ID
    //! Return -1 if not component was found..
    int GetTLMComponentID(const std::string& Name);

    //! Find  TLMInterface by its FullName (\<Component>.\<Interface>)
    //! and return its ID. Return -1 if not found.
    int GetTLMInterfaceID(std::string& FullName);

    //! Add TLM interface proxy with a given name to the Model, return its ID.
    int RegisterTLMInterfaceProxy(const int ComponentID, std::string& Name, int Dimensions=6,
                                  std::string Causality="bidirectional", std::string Domain="mechanical");

    int RegisterComponentParameterProxy(const int ComponentID, std::string& Name, std::string& DefaultValue);

    //! Return the TLMInterfaceProxy associated with the given ID.
    TLMInterfaceProxy& GetTLMInterfaceProxy(const int ID) {
        return *(Interfaces[ID]);
    }

    // Return the ComponentParameterProxy associated with the given ID.
    ComponentParameterProxy& GetComponentParameterProxy(const int ID) {
        return *(ComponentParameters[ID]);
    }

    //! Find TLMInterface belonging to a given component (ID)
    //! with a specified name and return its ID.
    int GetTLMInterfaceID(const int ComponentID, std::string& Name);

    //! Find ComponentParameter belonging to a given component (ID)
    //! with a specified name and return its ID.
    int GetComponentParameterID(const int ComponentID, std::string& Name);

    //! Add a TLMConnection to the model.
    //! Input:
    //! ifc1, ifc2 - ID of the TLM interfaces the connection is attaching to.
    //! param - parameters of the Connection
    int RegisterTLMConnection(int ifc1, int ifc2, TLMConnectionParams& param);

    //! Get the TLMConnection associated with the ID.
    TLMConnection& GetTLMConnection(int ConnID) {
        return *(Connections[ConnID]);
    }

    //! Start component executables
    void StartComponents();

    //! Get the reference to the Model simulation parameters
    SimulationParams& GetSimParams() {
        return SimParams;
    }

    //! Check that all the proxies are connected to the clients
    bool CheckProxyComm();

    //! Print meta-model to ostream.
    void Print(std::ostream&);
};



#endif

