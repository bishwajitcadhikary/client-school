import{u as S,r as c,a as $,c as C,w as l,b as F,o as d,d as t,e as T,f as i,g as s,h as k,i as w,j as B,a9 as e,aa as g,ab as N,l as U,k as n,M as j,n as E,p as L,V as P}from"./app.1c5f90d7.js";import{r as A}from"./rules.2de187a3.js";import{V as K}from"./VForm.f8d11054.js";import{V as M}from"./VTable.9815074e.js";const O={width:"50%"},q={class:"pa-2"},G={__name:"Phrases",props:{language:{type:Object,default:null},phrases:{type:Object,default:null}},setup(p){const m=p,V=S(),u=c(!1),b=c(),o=$({_method:"PUT",phrases:m.phrases});function _(){u.value&&o.post(route("admin.settings.languages.update-phrases",{language:m.language.id}),{onSuccess:a=>{V.showNotification(a)}})}return(a,f)=>{const v=F("AppLayout");return d(),C(v,null,{default:l(()=>[t(P,null,{default:l(()=>[t(T,null,{default:l(()=>[i(s(a.$t("Edit Phrases")),1)]),_:1}),t(k,null,{default:l(()=>[i(s(a.$t("Edit :language language phrases",{language:p.language.name})),1)]),_:1}),t(w,null,{default:l(()=>[t(K,{ref_key:"phraseForm",ref:b,modelValue:u.value,"onUpdate:modelValue":f[0]||(f[0]=h=>u.value=h),"lazy-validation":"",onSubmit:B(_,["prevent"])},{default:l(()=>[t(M,{class:"table-rounded mb-5","fixed-header":"","fixed-footer":"",height:"700"},{default:l(()=>[e("thead",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])]),e("tbody",null,[(d(!0),g(j,null,N(n(o).phrases,(h,r)=>(d(),g("tr",{key:r},[e("td",O,s(r),1),e("td",q,[t(U,{modelValue:n(o).phrases[r],"onUpdate:modelValue":y=>n(o).phrases[r]=y,rules:[n(A).required]},null,8,["modelValue","onUpdate:modelValue","rules"])])]))),128))]),e("tfoot",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])])]),_:1}),t(E,{type:"submit",loading:n(o).processing,disabled:!u.value},{default:l(()=>[t(L,{icon:"mdi-content-save"}),i(" "+s(a.$t("Save")),1)]),_:1},8,["loading","disabled"])]),_:1},8,["modelValue","onSubmit"])]),_:1})]),_:1})]),_:1})}}};export{G as default};