import{r as c,c as S,w as o,o as y,d as e,V as d,i,l as w,au as t,av as _,aw as b,p as h,g as s,M as A,n as v,f as r,j as T}from"./app.d12111a2.js";import{V as u}from"./VRow.a42250e5.js";import{V as g}from"./VForm.bbb8df20.js";import{V as n}from"./VCol.4fb9d811.js";import{V as N}from"./VSelect.7ed835a6.js";import{V as O}from"./VChip.63a6f5b3.js";import{V as R}from"./VTable.4e88a8b6.js";/* empty css              */import"./VCheckboxBtn.522e9dc8.js";import"./VSelectionControl.2cf78e55.js";const F=t("p",{class:"text-base font-weight-medium mt-2"}," Password Requirements: ",-1),E={class:"d-flex flex-column gap-y-3"},M={class:"font-weight-medium"},L=t("p",{class:"font-weight-semibold"}," Two factor authentication is not enabled yet. ",-1),B=t("p",null,[r(" Two-factor authentication adds an additional layer of security to your account by requiring more than just a password to log in. "),t("a",{href:"javascript:void(0)",class:"text-decoration-none"},"Learn more.")],-1),q={class:"d-flex align-center flex-wrap mb-3"},D={class:"text-h6 mb-0 me-3"},j={class:"text-base font-weight-semibold"},W={class:"me-3"},Y=t("thead",null,[t("tr",null,[t("th",{scope:"col"}," BROWSER "),t("th",{scope:"col"}," DEVICE "),t("th",{scope:"col"}," LOCATION "),t("th",{scope:"col"}," RECENT ACTIVITIES ")])],-1),te={__name:"AccountSettingsSecurity",setup(z){const p=c(!1),m=c(!1),f=c(!1),V=c("12345678"),C=c("87654321"),x=c("87654321"),I=["Minimum 8 characters long - the more, the better","At least one lowercase character","At least one number, symbol, or whitespace character"],P=[{name:"Server Key 1",key:"23eaf7f0-f4f7-495e-8b86-fad3261282ac",createdOn:"28 Apr 2021, 18:20 GTM+4:10",permission:"Full Access"},{name:"Server Key 2",key:"bb98e571-a2e2-4de8-90a9-2e231b5e99",createdOn:"12 Feb 2021, 10:30 GTM+2:30",permission:"Read Only"},{name:"Server Key 3",key:"2e915e59-3105-47f2-8838-6e46bf83b711",createdOn:"28 Dec 2020, 12:21 GTM+4:10",permission:"Full Access"}],k=[{browser:"Chrome on Windows",device:"HP Spectre 360",location:"New York, NY",recentActivity:"28 Apr 2022, 18:20",deviceIcon:{icon:"mdi-microsoft-windows",color:"primary"}},{browser:"Chrome on iPhone",device:"iPhone 12x",location:"Los Angeles, CA",recentActivity:"20 Apr 2022, 10:20",deviceIcon:{icon:"mdi-cellphone",color:"error"}},{browser:"Chrome on Android",device:"Oneplus 9 Pro",location:"San Francisco, CA",recentActivity:"16 Apr 2022, 04:20",deviceIcon:{icon:"mdi-android",color:"success"}},{browser:"Chrome on MacOS",device:"Apple iMac",location:"New York, NY",recentActivity:"28 Apr 2022, 18:20",deviceIcon:{icon:"mdi-apple",color:"secondary"}},{browser:"Chrome on Windows",device:"HP Spectre 360",location:"Los Angeles, CA",recentActivity:"20 Apr 2022, 10:20",deviceIcon:{icon:"mdi-microsoft-windows",color:"primary"}},{browser:"Chrome on Android",device:"Oneplus 9 Pro",location:"San Francisco, CA",recentActivity:"16 Apr 2022, 04:20",deviceIcon:{icon:"mdi-android",color:"success"}}];return(G,a)=>(y(),S(u,null,{default:o(()=>[e(n,{cols:"12"},{default:o(()=>[e(d,{title:"Change Password"},{default:o(()=>[e(g,null,{default:o(()=>[e(i,null,{default:o(()=>[e(u,{class:"mb-3"},{default:o(()=>[e(n,{cols:"12",md:"6"},{default:o(()=>[e(w,{modelValue:V.value,"onUpdate:modelValue":a[0]||(a[0]=l=>V.value=l),type:p.value?"text":"password","append-inner-icon":p.value?"mdi-eye-off-outline":"mdi-eye-outline",label:"Current Password","onClick:appendInner":a[1]||(a[1]=l=>p.value=!p.value)},null,8,["modelValue","type","append-inner-icon"])]),_:1})]),_:1}),e(u,null,{default:o(()=>[e(n,{cols:"12",md:"6"},{default:o(()=>[e(w,{modelValue:C.value,"onUpdate:modelValue":a[2]||(a[2]=l=>C.value=l),type:m.value?"text":"password","append-inner-icon":m.value?"mdi-eye-off-outline":"mdi-eye-outline",label:"New Password","onClick:appendInner":a[3]||(a[3]=l=>m.value=!m.value)},null,8,["modelValue","type","append-inner-icon"])]),_:1}),e(n,{cols:"12",md:"6"},{default:o(()=>[e(w,{modelValue:x.value,"onUpdate:modelValue":a[4]||(a[4]=l=>x.value=l),type:f.value?"text":"password","append-inner-icon":f.value?"mdi-eye-off-outline":"mdi-eye-outline",label:"Confirm New Password","onClick:appendInner":a[5]||(a[5]=l=>f.value=!f.value)},null,8,["modelValue","type","append-inner-icon"])]),_:1})]),_:1})]),_:1}),e(i,null,{default:o(()=>[F,t("ul",E,[(y(),_(A,null,b(I,l=>t("li",{key:l,class:"d-flex"},[t("div",null,[e(h,{size:"7",icon:"mdi-circle",class:"me-3"})]),t("span",M,s(l),1)])),64))])]),_:1}),e(i,{class:"d-flex flex-wrap gap-4"},{default:o(()=>[e(v,null,{default:o(()=>[r("Save changes")]),_:1}),e(v,{type:"reset",color:"secondary",variant:"tonal"},{default:o(()=>[r(" Reset ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(d,{title:"Two-steps verification"},{default:o(()=>[e(i,null,{default:o(()=>[L,B,e(v,null,{default:o(()=>[r(" Enable two-factor authentication ")]),_:1})]),_:1})]),_:1})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(d,{title:"Create an API key"},{default:o(()=>[e(u,null,{default:o(()=>[e(n,{cols:"12",md:"5","order-md":"0",order:"1"},{default:o(()=>[e(i,null,{default:o(()=>[e(g,{onSubmit:a[6]||(a[6]=T(()=>{},["prevent"]))},{default:o(()=>[e(u,null,{default:o(()=>[e(n,{cols:"12"},{default:o(()=>[e(N,{label:"Choose the API key type you want to create",items:["Full Control","Modify","Read & Execute","List Folder Contents","Read Only","Read & Write"]})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(w,{label:"Name the API key"})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(v,{type:"submit",block:""},{default:o(()=>[r(" Create Key ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(d,{title:"API Key List & Access"},{default:o(()=>[e(i,null,{default:o(()=>[r(" An API key is a simple encrypted string that identifies an application without any principal. They are useful for accessing public data anonymously, and are used to associate API requests with your project for quota and billing. ")]),_:1}),e(i,{class:"d-flex flex-column gap-y-4"},{default:o(()=>[(y(),_(A,null,b(P,l=>t("div",{key:l.key,class:"bg-var-theme-background pa-4"},[t("div",q,[t("h6",D,s(l.name),1),e(O,{label:"",color:"primary",size:"small"},{default:o(()=>[r(s(l.permission),1)]),_:2},1024)]),t("p",j,[t("span",W,s(l.key),1),e(h,{size:18,icon:"mdi-content-copy",class:"cursor-pointer"})]),t("span",null,"Created on "+s(l.createdOn),1)])),64))]),_:1})]),_:1})]),_:1}),e(n,{cols:"12"},{default:o(()=>[e(d,{title:"Recent Devices"},{default:o(()=>[e(R,{class:"text-no-wrap"},{default:o(()=>[Y,t("tbody",null,[(y(),_(A,null,b(k,l=>t("tr",{key:l.recentActivity},[t("td",null,[e(h,{start:"",icon:l.deviceIcon.icon,color:l.deviceIcon.color},null,8,["icon","color"]),r(" "+s(l.browser),1)]),t("td",null,s(l.device),1),t("td",null,s(l.location),1),t("td",null,s(l.recentActivity),1)])),64))])]),_:1})]),_:1})]),_:1})]),_:1}))}};export{te as default};