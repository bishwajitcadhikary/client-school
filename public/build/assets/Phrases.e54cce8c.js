import{aA as S,h as c,aB as C,c as F,w as l,r as $,o as d,a as t,al as B,f as i,t as s,aC as T,ac as w,aD as k,b as e,d as V,e as E,aE as N,u as n,F as U,K as A,a8 as K,V as L}from"./app.769d2bc8.js";import{r as P}from"./rules.04dd8ab5.js";import{V as j}from"./VForm.02b40034.js";import{V as D}from"./VTable.cecf783c.js";const O={width:"50%"},q={class:"pa-2"},G={__name:"Phrases",props:{language:{type:Object,default:null},phrases:{type:Object,default:null}},setup(m){const p=m,g=S(),u=c(!1),b=c(),o=C({_method:"PUT",phrases:p.phrases});function _(){u.value&&o.post(route("admin.settings.languages.update-phrases",{language:p.language.id}),{onSuccess:a=>{g.showNotification(a)}})}return(a,f)=>{const v=$("AdminLayout");return d(),F(v,null,{default:l(()=>[t(L,null,{default:l(()=>[t(B,null,{default:l(()=>[i(s(a.$t("Edit Phrases")),1)]),_:1}),t(T,null,{default:l(()=>[i(s(a.$t("Edit :language language phrases",{language:m.language.name})),1)]),_:1}),t(w,null,{default:l(()=>[t(j,{ref_key:"phraseForm",ref:b,modelValue:u.value,"onUpdate:modelValue":f[0]||(f[0]=h=>u.value=h),"lazy-validation":"",onSubmit:k(_,["prevent"])},{default:l(()=>[t(D,{class:"table-rounded mb-5","fixed-header":"","fixed-footer":"",height:"700"},{default:l(()=>[e("thead",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])]),e("tbody",null,[(d(!0),V(U,null,E(n(o).phrases,(h,r)=>(d(),V("tr",{key:r},[e("td",O,s(r),1),e("td",q,[t(N,{modelValue:n(o).phrases[r],"onUpdate:modelValue":y=>n(o).phrases[r]=y,rules:[n(P).required]},null,8,["modelValue","onUpdate:modelValue","rules"])])]))),128))]),e("tfoot",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])])]),_:1}),t(A,{type:"submit",loading:n(o).processing,disabled:!u.value},{default:l(()=>[t(K,{icon:"mdi-content-save"}),i(" "+s(a.$t("Save")),1)]),_:1},8,["loading","disabled"])]),_:1},8,["modelValue","onSubmit"])]),_:1})]),_:1})]),_:1})}}};export{G as default};
