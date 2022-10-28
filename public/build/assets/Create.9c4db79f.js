import{u as U,a as A,r as d,bA as T,c as p,w as a,b as j,o as c,d as e,V as N,e as B,f,g as v,h as F,i as I,j as L,k as o,O as V,Q as h,bb as q,l as S,n as x,p as D,aE as E}from"./app.f42d8be4.js";import{r as w}from"./rules.fb9e4542.js";import{V as C}from"./VRow.27f16036.js";import{V as n}from"./VCol.9cbf2e91.js";import{V as O}from"./VForm.620e1b51.js";import{V as P}from"./VAutocomplete.3b6ab715.js";import{V as z}from"./VChip.26b3479b.js";import{V as H}from"./VSwitch.1f3faaaf.js";import{V as M}from"./VContainer.0a92d41a.js";/* empty css              */import"./VSelect.82db8c00.js";import"./VCheckboxBtn.49e0f64e.js";import"./VSelectionControl.68e94a0f.js";const re={__name:"Create",props:{customers:{type:Object,default:null}},setup(g){const y=g,k=U(),s=A({customer:null,name:null,domain:null,is_active:!0});function _(){s.post(route("admin.schools.store"),{onSuccess:l=>{k.showNotification(l)}})}const m=d(null),i=d(!1),b=d([...y.customers.map(l=>({value:l.id,name:l.name,avatar:l.avatar}))]);return T(()=>{if(m.value){if(i.value)return;i.value=!0,setTimeout(()=>{E.Inertia.visit(route("admin.schools.create"),{preserveState:!0,preserveScroll:!0,only:["customers"],headers:{search:m.value},onSuccess:l=>{b.value=[...l.props.customers.map(t=>({value:t.id,name:t.name,avatar:t.avatar}))]}})},500),i.value=!1}}),(l,t)=>{const $=j("AdminLayout");return c(),p($,{title:l.$t("Create School"),back:l.route("admin.schools.index")},{default:a(()=>[e(M,null,{default:a(()=>[e(C,{justify:"center"},{default:a(()=>[e(n,{cols:"12",md:"8"},{default:a(()=>[e(N,null,{default:a(()=>[e(B,null,{default:a(()=>[f(v(l.$t("Create School")),1)]),_:1}),e(F,null,{default:a(()=>[f(v(l.$t("Here you can create new school")),1)]),_:1}),e(I,null,{default:a(()=>[e(O,{onSubmit:L(_,["prevent"])},{default:a(()=>[e(C,null,{default:a(()=>[e(n,{cols:"12"},{default:a(()=>[e(P,{modelValue:o(s).customer,"onUpdate:modelValue":t[0]||(t[0]=r=>o(s).customer=r),search:m.value,"onUpdate:search":t[1]||(t[1]=r=>m.value=r),disabled:i.value,items:b.value,filled:"",chips:"","closable-chips":"",label:l.$t("Select Customer"),"item-title":"name","item-value":"value"},{chip:a(({props:r,item:u})=>[e(z,V(r,{"prepend-avatar":u.raw.avatar,text:u.raw.name,value:u.raw.value}),null,16,["prepend-avatar","text","value"])]),item:a(({props:r,item:u})=>[typeof u.raw!="object"?(c(),p(h,q(V({key:0},r)),null,16)):(c(),p(h,V({key:1},r,{"prepend-avatar":u.raw.avatar,title:u.raw.name,value:u.raw.value}),null,16,["prepend-avatar","title","value"]))]),_:1},8,["modelValue","search","disabled","items","label"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(S,{modelValue:o(s).name,"onUpdate:modelValue":t[2]||(t[2]=r=>o(s).name=r),label:l.$t("School Name"),rules:[o(w).required],"error-messages":o(s).errors.name},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(S,{modelValue:o(s).domain,"onUpdate:modelValue":t[3]||(t[3]=r=>o(s).domain=r),label:l.$t("Domain"),rules:[o(w).required],"error-messages":o(s).errors.domain,hint:"example: school.com or school.example.com"},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(H,{modelValue:o(s).is_active,"onUpdate:modelValue":t[4]||(t[4]=r=>o(s).is_active=r),label:l.$t("Active"),"error-messages":o(s).errors.is_active},null,8,["modelValue","label","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(x,{class:"d-md-block",type:"submit",loading:o(s).processing},{default:a(()=>[e(D,{icon:"mdi-content-save"}),f(" "+v(l.$t("Save")),1)]),_:1},8,["loading"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{re as default};
