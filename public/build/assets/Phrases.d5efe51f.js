import{u as S,r as c,a as $,c as w,w as l,b as C,o as d,d as t,e as F,f as i,g as s,h as T,i as k,j as B,av as e,aw as V,ax as N,k as r,H as U,m as j,n as E,V as L}from"./app.88dbe7b3.js";import{r as P}from"./rules.23965050.js";import{V as x}from"./VForm.a530d3c0.js";import{V as A}from"./VTable.86cf7a82.js";import{V as K}from"./VTextField.b60301ed.js";import"./form.4587b2ea.js";import"./VCounter.473ffdf9.js";import"./VLabel.3c5713ec.js";const O={width:"50%"},q={class:"pa-2"},R={__name:"Phrases",props:{language:{type:Object,default:null},phrases:{type:Object,default:null}},setup(p){const m=p,g=S(),n=c(!1),b=c(),o=$({_method:"PUT",phrases:m.phrases});function v(){n.value&&o.post(route("admin.settings.languages.update-phrases",{language:m.language.id}),{onSuccess:a=>{g.showNotification(a)}})}return(a,f)=>{const _=C("AppLayout");return d(),w(_,null,{default:l(()=>[t(L,null,{default:l(()=>[t(F,null,{default:l(()=>[i(s(a.$t("Edit Phrases")),1)]),_:1}),t(T,null,{default:l(()=>[i(s(a.$t("Edit :language language phrases",{language:p.language.name})),1)]),_:1}),t(k,null,{default:l(()=>[t(x,{ref_key:"phraseForm",ref:b,modelValue:n.value,"onUpdate:modelValue":f[0]||(f[0]=h=>n.value=h),"lazy-validation":"",onSubmit:B(v,["prevent"])},{default:l(()=>[t(A,{class:"table-rounded mb-5","fixed-header":"","fixed-footer":"",height:"700"},{default:l(()=>[e("thead",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])]),e("tbody",null,[(d(!0),V(U,null,N(r(o).phrases,(h,u)=>(d(),V("tr",{key:u},[e("td",O,s(u),1),e("td",q,[t(K,{modelValue:r(o).phrases[u],"onUpdate:modelValue":y=>r(o).phrases[u]=y,rules:[r(P).required]},null,8,["modelValue","onUpdate:modelValue","rules"])])]))),128))]),e("tfoot",null,[e("tr",null,[e("th",null,s(a.$t("Key")),1),e("th",null,s(a.$t("Value")),1)])])]),_:1}),t(j,{type:"submit",loading:r(o).processing,disabled:!n.value},{default:l(()=>[t(E,{icon:"mdi-content-save"}),i(" "+s(a.$t("Save")),1)]),_:1},8,["loading","disabled"])]),_:1},8,["modelValue","onSubmit"])]),_:1})]),_:1})]),_:1})}}};export{R as default};