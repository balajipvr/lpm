import axios from 'axios'

var http = axios.create({
    baseURL: window.location.origin,
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }
});

export default http;
