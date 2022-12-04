import{u as U,a as T,r as d,bm as j,c as p,w as a,b as A,o as c,d as e,V as N,e as B,f,g as v,h as D,i as F,j as I,k as o,Y as L,D as V,W as h,bn as q,m as x,n as P,aK as z}from"./app.c74c21f4.js";import{r as S}from"./rules.aed30137.js";import{V as w}from"./VRow.51c37cbe.js";import{V as n}from"./VCol.fb68aa0d.js";import{V as E}from"./VForm.64f4569b.js";import{V as H}from"./VAutocomplete.7a513081.js";import{V as C}from"./VTextField.2cf6dc35.js";import{V as K}from"./VSwitch.c46a2151.js";import{V as M}from"./VContainer.9871394f.js";/* empty css              */import"./form.655e4f4e.js";import"./VSelect.5810ae9c.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./VCounter.bd549793.js";const ue={__name:"Create",props:{customers:{type:Object,default:null}},setup(g){const y=g,k=U(),s=T({customer:null,name:null,domain:null,is_active:!0});function _(){s.post(route("admin.schools.store"),{onSuccess:l=>{k.showNotification(l)}})}const m=d(null),i=d(!1),b=d([...y.customers.map(l=>({value:l.id,name:l.name,avatar:l.avatar}))]);return j(()=>{if(m.value){if(i.value)return;i.value=!0,setTimeout(()=>{z.Inertia.visit(route("admin.schools.create"),{preserveState:!0,preserveScroll:!0,only:["customers"],headers:{search:m.value},onSuccess:l=>{b.value=[...l.props.customers.map(t=>({value:t.id,name:t.name,avatar:t.avatar}))]}})},500),i.value=!1}}),(l,t)=>{const $=A("AppLayout");return c(),p($,{title:l.$t("Create School"),back:l.route("admin.schools.index")},{default:a(()=>[e(M,null,{default:a(()=>[e(w,{justify:"center"},{default:a(()=>[e(n,{cols:"12",md:"8"},{default:a(()=>[e(N,null,{default:a(()=>[e(B,null,{default:a(()=>[f(v(l.$t("Create School")),1)]),_:1}),e(D,null,{default:a(()=>[f(v(l.$t("Here you can create new school")),1)]),_:1}),e(F,null,{default:a(()=>[e(E,{onSubmit:I(_,["prevent"])},{default:a(()=>[e(w,null,{default:a(()=>[e(n,{cols:"12"},{default:a(()=>[e(H,{modelValue:o(s).customer,"onUpdate:modelValue":t[0]||(t[0]=r=>o(s).customer=r),search:m.value,"onUpdate:search":t[1]||(t[1]=r=>m.value=r),disabled:i.value,items:b.value,filled:"",chips:"","closable-chips":"",label:l.$t("Select Customer"),"item-title":"name","item-value":"value"},{chip:a(({props:r,item:u})=>[e(L,V(r,{"prepend-avatar":u.raw.avatar,text:u.raw.name,value:u.raw.value}),null,16,["prepend-avatar","text","value"])]),item:a(({props:r,item:u})=>[typeof u.raw!="object"?(c(),p(h,q(V({key:0},r)),null,16)):(c(),p(h,V({key:1},r,{"prepend-avatar":u.raw.avatar,title:u.raw.name,value:u.raw.value}),null,16,["prepend-avatar","title","value"]))]),_:1},8,["modelValue","search","disabled","items","label"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(C,{modelValue:o(s).name,"onUpdate:modelValue":t[2]||(t[2]=r=>o(s).name=r),label:l.$t("School Name"),rules:[o(S).required],"error-messages":o(s).errors.name},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(C,{modelValue:o(s).domain,"onUpdate:modelValue":t[3]||(t[3]=r=>o(s).domain=r),label:l.$t("Domain"),rules:[o(S).required],"error-messages":o(s).errors.domain,hint:"example: school.com or school.example.com"},null,8,["modelValue","label","rules","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(K,{modelValue:o(s).is_active,"onUpdate:modelValue":t[4]||(t[4]=r=>o(s).is_active=r),label:l.$t("Active"),"error-messages":o(s).errors.is_active},null,8,["modelValue","label","error-messages"])]),_:1}),e(n,{cols:"12"},{default:a(()=>[e(x,{class:"d-md-block",type:"submit",loading:o(s).processing},{default:a(()=>[e(P,{icon:"mdi-content-save"}),f(" "+v(l.$t("Save")),1)]),_:1},8,["loading"])]),_:1})]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{ue as default};