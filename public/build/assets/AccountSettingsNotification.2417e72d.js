import{r as m,c as f,w as a,V as w,o as s,d as t,f as n,i as p,av as e,aw as d,ax as y,g as _,H as h,aQ as b,j as x,m as c}from"./app.c74c21f4.js";import{V as u}from"./VCheckbox.62885493.js";import{V as g}from"./VTable.bbaee15f.js";import{V as v}from"./VForm.64f4569b.js";import{V as A}from"./VRow.51c37cbe.js";import{V as U}from"./VCol.fb68aa0d.js";import{V as k}from"./VSelect.5810ae9c.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";/* empty css              */import"./VTextField.2cf6dc35.js";import"./VCounter.bd549793.js";const B=e("a",{href:"javascript:void(0)"},"Request Permission",-1),C=e("thead",null,[e("tr",null,[e("th",{scope:"col"}," Type "),e("th",{scope:"col"}," EMAIL "),e("th",{scope:"col"}," BROWSER "),e("th",{scope:"col"}," App ")])],-1),N=e("p",{class:"text-base font-weight-medium"}," When should we send you notifications? ",-1),R={class:"d-flex flex-wrap gap-4 mt-4"},G={__name:"AccountSettingsNotification",setup(S){const V=m([{type:"New for you",email:!0,browser:!0,app:!0},{type:"Account activity",email:!0,browser:!0,app:!0},{type:"A new browser used to sign in",email:!0,browser:!0,app:!1},{type:"A new device is linked",email:!0,browser:!1,app:!1}]),i=m("Only when I'm online");return(D,r)=>(s(),f(w,{title:"Recent Devices"},{default:a(()=>[t(p,null,{default:a(()=>[n(" We need permission from your browser to show notifications. "),B]),_:1}),t(g,{class:"text-no-wrap"},{default:a(()=>[C,e("tbody",null,[(s(!0),d(h,null,y(V.value,o=>(s(),d("tr",{key:o.type},[e("td",null,_(o.type),1),e("td",null,[t(u,{modelValue:o.email,"onUpdate:modelValue":l=>o.email=l},null,8,["modelValue","onUpdate:modelValue"])]),e("td",null,[t(u,{modelValue:o.browser,"onUpdate:modelValue":l=>o.browser=l},null,8,["modelValue","onUpdate:modelValue"])]),e("td",null,[t(u,{modelValue:o.app,"onUpdate:modelValue":l=>o.app=l},null,8,["modelValue","onUpdate:modelValue"])])]))),128))])]),_:1}),t(b),t(p,null,{default:a(()=>[t(v,{onSubmit:r[1]||(r[1]=x(()=>{},["prevent"]))},{default:a(()=>[N,t(A,null,{default:a(()=>[t(U,{cols:"12",sm:"6"},{default:a(()=>[t(k,{modelValue:i.value,"onUpdate:modelValue":r[0]||(r[0]=o=>i.value=o),mandatory:"",items:["Only when I'm online","Anytime"]},null,8,["modelValue"])]),_:1})]),_:1}),e("div",R,[t(c,{type:"submit"},{default:a(()=>[n(" Save Changes ")]),_:1}),t(c,{color:"secondary",variant:"tonal",type:"reset"},{default:a(()=>[n(" Reset ")]),_:1})])]),_:1})]),_:1})]),_:1}))}};export{G as default};