import{u as _,a as g,c as y,w as o,b as S,o as k,d as e,V as C,aN as w,e as $,f as u,g as d,i as N,j as T,l as i,k as t,n as v,p as B}from"./app.75fe97d5.js";import{r as c}from"./rules.e0338894.js";import{V as p}from"./VRow.1decdef7.js";import{V as r}from"./VCol.73001860.js";import{V as U}from"./VAlert.6eca066d.js";import{V as j}from"./VForm.36860c1c.js";import{V as A}from"./VContainer.5696422c.js";/* empty css              */const O={__name:"Edit",props:{school:{type:Object,default:null}},setup(f){const n=f,V=_(),l=g({_method:"PUT",name:n.school.name,domain:n.school.domain});function b(){l.post(route("customer.schools.update",{school:n.school.id}),{onSuccess:a=>{V.showNotification(a)}})}return(a,s)=>{const h=S("AppLayout");return k(),y(h,{title:a.$t("Edit School"),back:a.route("customer.schools.index")},{default:o(()=>[e(A,null,{default:o(()=>[e(p,{justify:"center"},{default:o(()=>[e(r,{cols:"12",md:"8"},{default:o(()=>[e(C,null,{default:o(()=>[e(w,null,{default:o(()=>[e($,null,{default:o(()=>[u(d(a.$t("Edit School")),1)]),_:1}),e(U,{title:a.$t("Be careful"),variant:"outlined",type:"warning",prominent:"",border:"top",class:"d-flex mt-3"},{default:o(()=>[u(d(a.$t("Website may not work properly if you change the domain name.")),1)]),_:1},8,["title"])]),_:1}),e(N,null,{default:o(()=>[e(j,{onSubmit:T(b,["prevent"])},{default:o(()=>[e(p,null,{default:o(()=>[e(r,{cols:"12"},{default:o(()=>[e(i,{modelValue:t(l).name,"onUpdate:modelValue":s[0]||(s[0]=m=>t(l).name=m),label:a.$t("School Name"),rules:[t(c).required],"error-messages":t(l).errors.name},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(r,{cols:"12"},{default:o(()=>[e(i,{modelValue:t(l).domain,"onUpdate:modelValue":s[1]||(s[1]=m=>t(l).domain=m),label:a.$t("Domain"),rules:[t(c).required],"error-messages":t(l).errors.domain,hint:"example: school.com or school.example.com"},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(r,{cols:"12"},{default:o(()=>[e(v,{class:"d-md-block",type:"submit",loading:t(l).processing},{default:o(()=>[e(B,{icon:"mdi-content-save"}),u(" "+d(a.$t("Update")),1)]),_:1},8,["loading"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{O as default};