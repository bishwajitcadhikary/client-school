import{M as h,B as M,y as v,r as d,_ as F,$ as B,a0 as b,a1 as E}from"./app.c74c21f4.js";const m=Symbol.for("vuetify:form"),w=h({disabled:Boolean,fastFail:Boolean,lazyValidation:Boolean,readonly:Boolean,modelValue:{type:Boolean,default:null}});function x(o){const n=M(o,"modelValue"),f=v(()=>o.disabled),c=v(()=>o.readonly),i=d(!1),l=d([]),t=d([]);async function g(){const e=[];let a=!0;t.value=[],i.value=!0;for(const r of l.value){const s=await r.validate();if(s.length>0&&(a=!1,e.push({id:r.id,errorMessages:s})),!a&&o.fastFail)break}return t.value=e,i.value=!1,{valid:a,errors:t.value}}function y(){l.value.forEach(e=>e.reset()),n.value=null}function V(){l.value.forEach(e=>e.resetValidation()),t.value=[],n.value=null}return F(l,()=>{let e=0,a=0;const r=[];for(const s of l.value)s.isValid===!1?(a++,r.push({id:s.id,errorMessages:s.errorMessages})):s.isValid===!0&&e++;t.value=r,n.value=a>0?!1:e===l.value.length?!0:null},{deep:!0}),B(m,{register:e=>{let{id:a,validate:r,reset:s,resetValidation:u}=e;l.value.some(p=>p.id===a)&&b(`Duplicate input name "${a}"`),l.value.push({id:a,validate:r,reset:s,resetValidation:u,isValid:null,errorMessages:[]})},unregister:e=>{l.value=l.value.filter(a=>a.id!==e)},update:(e,a,r)=>{const s=l.value.find(u=>u.id===e);!s||(s.isValid=a,s.errorMessages=r)},isDisabled:f,isReadonly:c,isValidating:i,items:l}),{errors:t,isDisabled:f,isReadonly:c,isValidating:i,items:l,validate:g,reset:y,resetValidation:V}}function D(){return E(m,null)}export{x as c,w as m,D as u};
