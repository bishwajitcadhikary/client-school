import{s as h,b9 as x,W as V,B as f,y as C,a1 as P,bd as v,d as s,O as o,bi as A}from"./app.340fc64f.js";import{m as B,f as I,V as y}from"./VCheckboxBtn.d5c7be82.js";const D=h({name:"VCheckbox",inheritAttrs:!1,props:{...x(),...B()},setup(e,a){let{attrs:r,slots:t}=a;const n=V(),c=f(()=>e.id||`checkbox-${n}`);return C(()=>{const[i,d]=P(r),[l,g]=v(e),[u,R]=I(e);return s(A,o({class:"v-checkbox"},i,l,{id:c.value}),{...t,default:p=>{let{id:b,isDisabled:k,isReadonly:m}=p;return s(y,o(u,{id:b.value,disabled:k.value,readonly:m.value},d),t)}})}),{}}});export{D as V};