## Brizy API Messages

In this lib we will have message classes that will be used by messenger 
component(or other messaging components from other languages)

All messages are declared as protobuf (v3) files in ./src. 
For more information about protobuf read https://developers.google.com/protocol-buffers/docs/proto3.

## How to declare a class

1. Create a custom-message.proto 
2. Declare a new value in DescriminatorType enum in: ./src/message.proto

## How to release and generate the code
1. Go to github repository and create a release: https://github.com/bagrinsergiu/brizy-protobuf-idl/releases
   This will trigger an github action that will generate the code and commit it in https://github.com/bagrinsergiu/brizy-protogen-php
2. If you created a new message you must go to https://github.com/bagrinsergiu/brizy-protogen-php 
   and add the new message in the ProtobufHydrator
   https://github.com/bagrinsergiu/brizy-protogen-php/blob/master/src/Hydrator/ProtobufHydrator.php
   PS: This is small problem that we need to automate.
   
#### WARNING: All classes must have `Message.DescriminatorType descriminator = 1;` as  first field.

Ex: 
```protobuf
message RemoveEntityTranslationMessage {
  Message.DescriminatorType descriminator = 1;
  int32 project_id = 2;
  string entity_iri = 3;
  string project_iri = 4;
}
```