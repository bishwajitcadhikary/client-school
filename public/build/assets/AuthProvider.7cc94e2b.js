import{bL as t,aw as c,ax as n,H as i,o as l,d as s,k as d,m as u}from"./app.c74c21f4.js";const v={__name:"AuthProvider",setup(f){const r=t(),e=[{provider:"facebook",icon:"mdi-facebook",color:"#4267b2",colorInDark:"#4267b2"},{provider:"twitter",icon:"mdi-twitter",color:"#1da1f2",colorInDark:"#1da1f2"},{provider:"google",icon:"mdi-google",color:"#272727",colorInDark:"#fff"}];return(a,m)=>(l(),c(i,null,n(e,o=>s(u,{key:o.icon,icon:o.icon,variant:"text",color:d(r).global.name.value==="dark"?o.colorInDark:o.color,href:a.route("oauth.redirect",o.provider)},null,8,["icon","color","href"])),64))}};export{v as default};