import{u as S,r as c,a as $,c as w,w as l,b as C,o as u,d as t,e as F,f as d,g as s,h as T,i as k,j as B,au as e,av as g,aw as N,l as U,k as o,M as j,n as E,p as L,V as P}from"./app.f42d8be4.js";import{r as A}from"./rules.fb9e4542.js";import{V as K}from"./VForm.620e1b51.js";import{V as M}from"./VTable.c8620f99.js";const O={width:"50%"},q={class:"pa-2"},G={__name:"Phrases",props:{language:{type:Object,default:null},phrases:{type:Object,default:null}},setup(i){const m=i,V=S(),p=c(!1),b=c(),n=$({_method:"PUT",phrases:m.phrases});function _(){n.post(route("admin.settings.languages.update-phrases",{language:m.language.id}),{onSuccess:a=>{V.showNotification(a)}})}return(a,f)=>{const v=C("AdminLayout");return u(),w(v,null,{default:l(()=>[t(P,null,{default:l(()=>[t(F,null,{default:l(()=>[d(s(a.$t("Edit Phrases")),1)]),_:1}),t(T,null,{default:l(()=>[d(s(a.$t("Edit :language language phrases",{language:i.language.name})),1)]),_:1}),t(k,null,{default:l(()=>[t(K,{ref_key:"phraseForm",ref:b,modelValue:p.value,"onUpdate:modelValue":f[0]||(f[0]=h=>p.value=h),"lazy-validation":"",onSubmit:B(_,["prevent"])},{default:l(()=>[t(M,{class:"table-rounded mb-5","fixed-header":"","fixed-footer":"",height:"700"},{default:l(()=>[e("thead",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])]),e("tbody",null,[(u(!0),g(j,null,N(o(n).phrases,(h,r)=>(u(),g("tr",{key:r},[e("td",O,s(r),1),e("td",q,[t(U,{modelValue:o(n).phrases[r],"onUpdate:modelValue":y=>o(n).phrases[r]=y,rules:[o(A).required]},null,8,["modelValue","onUpdate:modelValue","rules"])])]))),128))]),e("tfoot",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])])]),_:1}),t(E,{type:"submit",loading:o(n).processing},{default:l(()=>[t(L,{icon:"mdi-content-save"}),d(" "+s(a.$t("Save")),1)]),_:1},8,["loading"])]),_:1},8,["modelValue","onSubmit"])]),_:1})]),_:1})]),_:1})}}};export{G as default};
