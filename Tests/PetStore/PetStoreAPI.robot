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
${order_body}   {'id':2,'petId':0,'quantity':1,'shipDate':'2021-12-06T20:14:06.647Z','status':'placed','complete':true}

${id}   ab_123456
${existent_id}   9223372016854784000
${existent_pet_json}    {'id': 9223372016854784000, 'category': {'id': 0, 'name': 'Puppy'}, 'name': 'Rocky', 'photoUrls': ['string'], 'tags': [{'id': 0, 'name': 'string'}], 'status': 'sold'}
${petname}   Lucky
${secondpetname}    Rocky
${pet_status}   sold


*** Test Cases ***

TC_01 Get Pet Store Inventory
    Create Session       PetStore_API    ${base_endpoint}
    ${get_inventory}=    GET On Session    PetStore_API     ${store_endpoint}/${inventory_endpoint}
    ${inventory_response}=    convert to string    ${get_inventory.status_code}
    should be equal      ${inventory_response}    ${200_response}

TC_02 Update Existent Pet Data
    Create Session      PetStore_API    ${base_endpoint}
    ${pet_response}=    POST On Session    PetStore_API     ${pet_endpoint}/9223372016854784000   ${secondpetname}   ${pet_status}
    log to console      ${pet_response.content}

TC_03 Get Pet by ID and Validate it was updated
    Create Session      PetStore_API    ${base_endpoint}
    ${get_id}=    GET On Session    PetStore_API     ${pet_endpoint}/${existent_id}
    ${response_code}=   convert to string    ${get_id.status_code}
    should be equal    ${response code}     ${200_response}
    ${json_response}=   convert to string    ${get_id.json()}
    should be equal     ${json_response}     ${existent_pet_json}