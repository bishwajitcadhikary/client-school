import{m as k,f as V,V as h}from"./VLabel.3c5713ec.js";import{m as x,f as C,V as P}from"./VCheckboxBtn.992999b2.js";import{q as v,a8 as A,y as I,s as y,C as B,d as s,D as o}from"./app.88dbe7b3.js";const q=v({name:"VCheckbox",inheritAttrs:!1,props:{...k(),...x()},setup(t,r){let{attrs:a,slots:e}=r;const n=A(),c=I(()=>t.id||`checkbox-${n}`);return y(()=>{const[i,d]=B(a),[l,g]=V(t),[p,D]=C(t);return s(h,o({class:"v-checkbox"},i,l,{id:c.value}),{...e,default:u=>{let{id:m,isDisabled:b,isReadonly:f}=u;return s(P,o(p,{id:m.value,disabled:b.value,readonly:f.value},d),e)}})}),{}}});export{q as V};