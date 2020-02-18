% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (C) OMG Plc 2009.
% All rights reserved.  This software is protected by copyright
% law and international treaties.  No part of this software / document
% may be reproduced or distributed in any form or by any means,
% whether transiently or incidentally to some other use of this software,
% without the written permission of the copyright owner.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part of the Vicon DataStream SDK for MATLAB.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modified ver.141229
% Data of markers in BufferForSave MATRIX
% You should select the Subject  
% in the region searching '수정'
% 
% 

    %% 
   
     addpath('DataStreamSDK')
%%


    % Program options
    TransmitMulticast = false;
    EnableHapticFeedbackTest = false;
    HapticOnList = {'ViconAP_001';'ViconAP_002'};

    % A dialog to stop the loop
    MessageBox = msgbox( 'Stop DataStream Client', 'Vicon DataStream SDK' );

    % Load the SDK
    fprintf( 'Loading SDK...' );
    Client.LoadViconDataStreamSDK();
    fprintf( 'done\n' );

    % Program options
    HostName = 'localhost:801';

    % Make a new client
    MyClient = Client();

    % Connect to a server
    fprintf( 'Connecting to %s ...', HostName );
    while ~MyClient.IsConnected().Connected
          % Direct connection
         MyClient.Connect( HostName );
         fprintf('Connection is Complete!!\n')

           % Multicast connection
           % MyClient.ConnectToMulticast( HostName, '224.0.0.0' );

        fprintf( '.' );
    end
    fprintf( '\n' );

    % Enable some different data types
    MyClient.EnableSegmentData();
    MyClient.EnableMarkerData();
    MyClient.EnableUnlabeledMarkerData();
    MyClient.EnableDeviceData();

    fprintf( 'Segment Data Enabled: %s\n',          AdaptBool( MyClient.IsSegmentDataEnabled().Enabled ) );
    fprintf( 'Marker Data Enabled: %s\n',           AdaptBool( MyClient.IsMarkerDataEnabled().Enabled ) );
    fprintf( 'Unlabeled Marker Data Enabled: %s\n', AdaptBool( MyClient.IsUnlabeledMarkerDataEnabled().Enabled ) );
    fprintf( 'Device Data Enabled: %s\n',           AdaptBool( MyClient.IsDeviceDataEnabled().Enabled ) );

    % Set the streaming mode
    MyClient.SetStreamMode( StreamMode.ClientPull );
    % MyClient.SetStreamMode( StreamMode.ClientPullPreFetch );
    % MyClient.SetStreamMode( StreamMode.ServerPush );

    % Set the global up axis
    MyClient.SetAxisMapping( Direction.Forward, ...
                             Direction.Left,    ...
                             Direction.Up );    % Z-up
    % MyClient.SetAxisMapping( Direction.Forward, ...
    %                          Direction.Up,      ...
    %                          Direction.Right ); % Y-up



    % Discover the version number
    Output_GetVersion = MyClient.GetVersion();
    fprintf( 'Version: %d.%d.%d\n', Output_GetVersion.Major, ...
                                    Output_GetVersion.Minor, ...
                                    Output_GetVersion.Point );

    if TransmitMulticast
      MyClient.StartTransmittingMulticast('localhost', '224.0.0.0' );
    end  




    Counter = 1;
    % Loop until the message box is dismissed
    while ishandle( MessageBox )
      drawnow;
      Counter = Counter + 1;

      % Get a frame
      fprintf( 'Waiting for new frame...' );
      while MyClient.GetFrame().Result.Value ~= Result.Success
          fprintf( '.' );
      end% while
      fprintf( '\n' );  

      if EnableHapticFeedbackTest
        if mod( Counter,2 ) == 0
          for i = 1:length( HapticOnList )  % HapticOnList = {'ViconAP_001';'ViconAP_002'};
                                            % length(HapticOnList) == 2
              DeviceName = HapticOnList{i};
              Output_GetApexFeedback = MyClient.SetApexDeviceFeedback( DeviceName, true );
              if Output_GetApexFeedback.Result.Value == Result.Success
                  fprintf( 'Turn haptic feedback on for device: %s\n', DeviceName );
              elseif Output_GetApexFeedback.Result.Value == Result.InvalidDeviceName
                  fprintf( 'Device doesn''t exist: %s\n', DeviceName );
              end
          end
        end
        if mod( Counter, 20 ) == 0  % 나머지 
          for i = 1:length( HapticOnList )
              DeviceName = HapticOnList{i};
              Output_GetApexFeedback = MyClient.SetApexDeviceFeedback( DeviceName, false );
              if Output_GetApexFeedback.Result.Value == Result.Success
                  fprintf( 'Turn haptic feedback on for device: %s\n', DeviceName );
              end
          end
        end
      end


      % Get the frame number
%       Output_GetFrameNumber = MyClient.GetFrameNumber();
%       fprintf( 'Frame Number: %d\n', Output_GetFrameNumber.FrameNumber );

      % Get the frame rate
%       Output_GetFrameRate = MyClient.GetFrameRate();
%       fprintf( 'Frame rate: %g\n', Output_GetFrameRate.FrameRateHz );

      % Count the number of subjects
%       SubjectCount = MyClient.GetSubjectCount().SubjectCount;
      SelectedSubject = 1;
%       fprintf( 'Selected Subjects (%d):\n', SelectedSubject );
      %for SubjectIndex = 1:SubjectCount 수정
      SubjectIndex = SelectedSubject;
      
%         fprintf( '  Subject #%d\n', SubjectIndex);

        % Get the subject name
        SubjectName = MyClient.GetSubjectName( SubjectIndex ).SubjectName;
%         fprintf( '    Name: %s\n', SubjectName );

        % Get the root segment
        RootSegment = MyClient.GetSubjectRootSegmentName( SubjectName ).SegmentName;
%         fprintf( '    Root Segment: %s\n', RootSegment );

        % Count the number of segments
        SegmentCount = MyClient.GetSegmentCount( SubjectName ).SegmentCount;
%         fprintf( '    Segments (%d):\n', SegmentCount );
        for SegmentIndex = 1:SegmentCount
%           fprintf( '      Segment #%d\n', SegmentIndex - 1 );

          % Get the segment name
          SegmentName = MyClient.GetSegmentName( SubjectName, SegmentIndex ).SegmentName;
%           fprintf( '        Name: %s\n', SegmentName );

          % Get the segment parent
          SegmentParentName = MyClient.GetSegmentParentName( SubjectName, SegmentName ).SegmentName;
%           fprintf( '        Parent: %s\n',  SegmentParentName );

          % Get the segment's children
          ChildCount = MyClient.GetSegmentChildCount( SubjectName, SegmentName ).SegmentCount;
%           fprintf( '     Children (%d):\n', ChildCount );
          for ChildIndex = 1:ChildCount
            ChildName = MyClient.GetSegmentChildName( SubjectName, SegmentName, ChildIndex ).SegmentName;
%             fprintf( '       %s\n', ChildName );
          end% for  


        end% SegmentIndex

        % Count the number of markers
        MarkerCount = MyClient.GetMarkerCount( SubjectName ).MarkerCount;
%         fprintf( '    Markers (%d):\n', MarkerCount );  

        for MarkerIndex = 1:MarkerCount
          % Get the marker name
          MarkerName = MyClient.GetMarkerName( SubjectName, MarkerIndex ).MarkerName;

          % Get the marker parent
          MarkerParentName = MyClient.GetMarkerParentName( SubjectName, MarkerName ).SegmentName;

          % Get the global marker translation
          Output_GetMarkerGlobalTranslation = MyClient.GetMarkerGlobalTranslation( SubjectName, MarkerName );

          fprintf( '      Marker #%d: %s (%g, %g, %g) %s\n',                     ...
                             MarkerIndex - 1,                                    ...
                             MarkerName,                                         ...
                             Output_GetMarkerGlobalTranslation.Translation( 1 ), ...
                             Output_GetMarkerGlobalTranslation.Translation( 2 ), ...
                             Output_GetMarkerGlobalTranslation.Translation( 3 ), ...
                             AdaptBool( Output_GetMarkerGlobalTranslation.Occluded ) );


    % 수정
        BufferForSave(Counter,3*MarkerIndex-2) = Output_GetMarkerGlobalTranslation.Translation( 1 );
        BufferForSave(Counter,3*MarkerIndex-1) = Output_GetMarkerGlobalTranslation.Translation( 2 );
        BufferForSave(Counter,3*MarkerIndex) = Output_GetMarkerGlobalTranslation.Translation( 3 );
%       BufferForSave
%       Marker1   Marker2   
%       X  Y  Z   X  Y  X
%         
%         


        end% MarkerIndex

%       end% SubjectIndex

      % Get the unlabeled markers
      UnlabeledMarkerCount = MyClient.GetUnlabeledMarkerCount().MarkerCount;
%       fprintf( '    Unlabeled Markers (%d):\n', UnlabeledMarkerCount );
      for UnlabeledMarkerIndex = 1:UnlabeledMarkerCount
        % Get the global marker translation
        Output_GetUnlabeledMarkerGlobalTranslation = MyClient.GetUnlabeledMarkerGlobalTranslation( UnlabeledMarkerIndex );
%         fprintf( '      Marker #%d: (%g, %g, %g)\n',                                    ...
                           UnlabeledMarkerIndex - 1,                                    ...
                           Output_GetUnlabeledMarkerGlobalTranslation.Translation( 1 ), ...
                           Output_GetUnlabeledMarkerGlobalTranslation.Translation( 2 ), ...
                           Output_GetUnlabeledMarkerGlobalTranslation.Translation( 3 ) ;
      end% UnlabeledMarkerIndex

      % Count the number of devices
      DeviceCount = MyClient.GetDeviceCount().DeviceCount;
%       fprintf( '  Devices (%d):\n', DeviceCount );

      for DeviceIndex = 1:DeviceCount

%         fprintf( '    Device #%d:\n', DeviceIndex - 1 );

        % Get the device name and type
        Output_GetDeviceName = MyClient.GetDeviceName( DeviceIndex );
        fprintf( '      Name: %s\n', Output_GetDeviceName.DeviceName );
        fprintf( '      Type: %s\n', Output_GetDeviceName.DeviceType.ToString() );

        % Count the number of device outputs
        DeviceOutputCount = MyClient.GetDeviceOutputCount( Output_GetDeviceName.DeviceName ).DeviceOutputCount;
        fprintf( '      Device Outputs (%d):\n', DeviceOutputCount );
        for DeviceOutputIndex = 1:DeviceOutputCount
          % Get the device output name and unit
          Output_GetDeviceOutputName = MyClient.GetDeviceOutputName( Output_GetDeviceName.DeviceName, DeviceOutputIndex );

          % Get the number of subsamples associated with this device.
          Output_GetDeviceOutputSubsamples = MyClient.GetDeviceOutputSubsamples( Output_GetDeviceName.DeviceName, Output_GetDeviceOutputName.DeviceOutputName );

          fprintf( '      Device Output #%d:\n', DeviceOutputIndex - 1 );

          fprintf( '      Samples (%d):\n', Output_GetDeviceOutputSubsamples.DeviceOutputSubsamples );


          for DeviceOutputSubsample = 1:Output_GetDeviceOutputSubsamples.DeviceOutputSubsamples
            fprintf( '        Sample #%d:\n', DeviceOutputSubsample - 1 );
            % Get the device output value
            Output_GetDeviceOutputValue = MyClient.GetDeviceOutputValue( Output_GetDeviceName.DeviceName, Output_GetDeviceOutputName.DeviceOutputName, DeviceOutputSubsample );

            fprintf( '          ''%s'' %g %s %s\n',                                    ...
                               Output_GetDeviceOutputName.DeviceOutputName,            ...
                               Output_GetDeviceOutputValue.Value,                      ...
                               Output_GetDeviceOutputName.DeviceOutputUnit.ToString(), ...
                               AdaptBool( Output_GetDeviceOutputValue.Occluded ) );
          end% DeviceOutputSubsample
        end% DeviceOutputIndex

      end% DeviceIndex

      % Count the number of force plates
      ForcePlateCount = MyClient.GetForcePlateCount().ForcePlateCount;
%       fprintf( '  Force Plates: (%d)\n', ForcePlateCount );
      for ForcePlateIndex = 1:ForcePlateCount
        fprintf( '    Force Plate #%d:\n', ForcePlateIndex - 1 );

        % Get the number of subsamples associated with this device.
        Output_GetForcePlateSubsamples = MyClient.GetForcePlateSubsamples( ForcePlateIndex );

        fprintf( '    Samples (%d):\n', Output_GetForcePlateSubsamples.ForcePlateSubsamples );
        for ForcePlateSubsample = 1:Output_GetForcePlateSubsamples.ForcePlateSubsamples
          % Output all the subsamples.
          fprintf( '      Sample #%d:\n', ForcePlateSubsample - 1 );

          Output_GetGlobalForceVector = MyClient.GetGlobalForceVector( ForcePlateIndex, ForcePlateSubsample );
          fprintf( '      Force (%g, %g, %g)\n',                           ...
                             Output_GetGlobalForceVector.ForceVector( 1 ), ...
                             Output_GetGlobalForceVector.ForceVector( 2 ), ...
                             Output_GetGlobalForceVector.ForceVector( 3 ) );

          Output_GetGlobalMomentVector = MyClient.GetGlobalMomentVector( ForcePlateIndex, ForcePlateSubsample );
          fprintf( '      Moment (%g, %g, %g)\n',                            ...
                             Output_GetGlobalMomentVector.MomentVector( 1 ), ...
                             Output_GetGlobalMomentVector.MomentVector( 2 ), ...
                             Output_GetGlobalMomentVector.MomentVector( 3 ) );

          Output_GetGlobalCentreOfPressure = MyClient.GetGlobalCentreOfPressure( ForcePlateIndex, ForcePlateSubsample );
          fprintf( '      CoP (%g, %g, %g)\n',                                       ...
                             Output_GetGlobalCentreOfPressure.CentreOfPressure( 1 ), ...
                             Output_GetGlobalCentreOfPressure.CentreOfPressure( 2 ), ...
                             Output_GetGlobalCentreOfPressure.CentreOfPressure( 3 ) );    
        end% ForcePlateSubsample                     
      end% ForcePlateIndex

      % Count the number of eye trackers
      EyeTrackerCount = MyClient.GetEyeTrackerCount().EyeTrackerCount;
%       fprintf( '  Eye Trackers: (%d)\n', EyeTrackerCount );
      for EyeTrackerIndex = 1:EyeTrackerCount
        fprintf( '    Eye Tracker #%d:\n', EyeTrackerIndex - 1 );

        Output_GetEyeTrackerGlobalPosition = MyClient.GetEyeTrackerGlobalPosition( EyeTrackerIndex );
        fprintf( '      Position (%g, %g, %g) %s\n',                       ...
                         Output_GetEyeTrackerGlobalPosition.Position( 1 ), ...
                         Output_GetEyeTrackerGlobalPosition.Position( 2 ), ...
                         Output_GetEyeTrackerGlobalPosition.Position( 3 ), ...
                         AdaptBool( Output_GetEyeTrackerGlobalPosition.Occluded ) );

        Output_GetEyeTrackerGlobalGazeVector = MyClient.GetEyeTrackerGlobalGazeVector( EyeTrackerIndex );
        fprintf( '      Gaze (%g, %g, %g) %s\n',                               ...
                         Output_GetEyeTrackerGlobalGazeVector.GazeVector( 1 ), ...
                         Output_GetEyeTrackerGlobalGazeVector.GazeVector( 2 ), ...
                         Output_GetEyeTrackerGlobalGazeVector.GazeVector( 3 ), ... 
                         AdaptBool( Output_GetEyeTrackerGlobalGazeVector.Occluded ) );

      end% EyeTrackerIndex  

    end% while true  

    if TransmitMulticast
      MyClient.StopTransmittingMulticast();
    end  

    % Disconnect and dispose
    MyClient.Disconnect();

    % Unload the SDK
    fprintf( 'Unloading SDK...' );
    Client.UnloadViconDataStreamSDK();
    fprintf( 'done\n' );

    
%     PlotBufferForSave;