
const fetchingAPI = (zip)=>{
  let danishZIP = [];
  (async () => {
    const response = await fetch(
      'https://parseapi.back4app.com/classes/DK_DK?limit=1470&keys=place,postalCode',
      {
        headers: {
          'X-Parse-Application-Id': 'jlFrL7o52wZUHD7H7oqOsEtjxbCahTqYfVjly5Gi', // This is your app's application id
          'X-Parse-REST-API-Key': 'fZcOf7QV3JbmpKjbW5gS2RxLlryvIH3WXG4vZSqU', // This is your app's REST API key
        }
      }
    );
    const data = await response.json(); // Here you have the data that you need
    console.log(data);
    console.log(data.results);
    data.results.forEach(element => {
      danishZIP.push(element)
    });
    const zipFound = danishZIP.filter(element => element.postalCode == zip)
    console.log(zipFound[0].place);
    /* console.log(JSON.stringify(data, null, 2)); */
  })();
}

export {fetchingAPI}
