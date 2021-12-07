*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

#Pet Store endpoints
${base_endpoint}   http://petstore.swagger.io/v2

#store endpoints
${store_endpoint}    store
${inventory_endpoint}    inventory
${order_endpoint}     order

#pet endpoints
${pet_endpoint}      pet

#response codes
${200_response}    200

#Test values
${new_pet}   {'id': 123456789, 'category': {'id': 0, 'name': 'dog'}, 'name': 'Lucky', 'photoUrls': ['string'], 'tags': [{'id': 0, 'name': 'string'}], 'status': 'available'}

${existent_id}   123456789
${secondpetname}    Rocky
${secondpet_status}   sold


*** Test Cases ***

TC_01 Add a New Pet
    Create Session       PetStore_API    ${base_endpoint}
    ${get_inventory}=    GET On Session    PetStore_API     ${store_endpoint}/${inventory_endpoint}
    ${inventory_response}=    convert to string    ${get_inventory.status_code}
    should be equal      ${inventory_response}    ${200_response}

TC_02 Update Existent Pet Data
    Create Session      PetStore_API    ${base_endpoint}
    ${pet_response}=    POST On Session    PetStore_API     ${pet_endpoint}/${existent_id}   ${secondpetname}   ${secondpet_status}
    log to console      ${pet_response.content}

TC_03 Get Pet by ID and Validate it was updated
    Create Session      PetStore_API    ${base_endpoint}
    ${get_id}=    GET On Session    PetStore_API     ${pet_endpoint}/${existent_id}
    ${response_code}=   convert to string    ${get_id.status_code}
    should be equal    ${response code}     ${200_response}
    ${json_response}=   convert to string    ${get_id.json()}
    should not be equal    ${json_response}     ${new_pet}