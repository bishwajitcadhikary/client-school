import{u as S,v as c,a as $,c as C,w as l,r as F,o as d,b as t,d as T,e as i,t as s,f as k,g as w,h as B,at as e,au as g,av as L,j as N,i as n,L as U,k as j,l as E,V as P}from"./app.dc2d0110.js";import{r as A}from"./rules.b4b678c9.js";import{V as K}from"./VForm.25e51c80.js";import{V as O}from"./VTable.13703ca8.js";const q={width:"50%"},x={class:"pa-2"},G={__name:"Phrases",props:{language:{type:Object,default:null},phrases:{type:Object,default:null}},setup(m){const p=m,V=S(),u=c(!1),b=c(),o=$({_method:"PUT",phrases:p.phrases});function v(){u.value&&o.post(route("admin.settings.languages.update-phrases",{language:p.language.id}),{onSuccess:a=>{V.showNotification(a)}})}return(a,f)=>{const _=F("AdminLayout");return d(),C(_,null,{default:l(()=>[t(P,null,{default:l(()=>[t(T,null,{default:l(()=>[i(s(a.$t("Edit Phrases")),1)]),_:1}),t(k,null,{default:l(()=>[i(s(a.$t("Edit :language language phrases",{language:m.language.name})),1)]),_:1}),t(w,null,{default:l(()=>[t(K,{ref_key:"phraseForm",ref:b,modelValue:u.value,"onUpdate:modelValue":f[0]||(f[0]=h=>u.value=h),"lazy-validation":"",onSubmit:B(v,["prevent"])},{default:l(()=>[t(O,{class:"table-rounded mb-5","fixed-header":"","fixed-footer":"",height:"700"},{default:l(()=>[e("thead",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])]),e("tbody",null,[(d(!0),g(U,null,L(n(o).phrases,(h,r)=>(d(),g("tr",{key:r},[e("td",q,s(r),1),e("td",x,[t(N,{modelValue:n(o).phrases[r],"onUpdate:modelValue":y=>n(o).phrases[r]=y,rules:[n(A).required]},null,8,["modelValue","onUpdate:modelValue","rules"])])]))),128))]),e("tfoot",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])])]),_:1}),t(j,{type:"submit",loading:n(o).processing,disabled:!u.value},{default:l(()=>[t(E,{icon:"mdi-content-save"}),i(" "+s(a.$t("Save")),1)]),_:1},8,["loading","disabled"])]),_:1},8,["modelValue","onSubmit"])]),_:1})]),_:1})]),_:1})}}};export{G as default};
