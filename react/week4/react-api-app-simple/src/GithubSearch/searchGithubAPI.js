

const baseURL='https://api.github.com/search/users'

export function searchUser(username){
    return fetch(`${baseURL}?q=${username}`).then(res=>res.json())
}

