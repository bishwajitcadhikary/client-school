import{r as $,ad as T,s as K,I as V,ae as O,$ as W,af as j,ag as q,ah as U,A as G,_ as J,ai as X,K as Y,J as H,aj as Q,ak as Z,al as A,am as ee,B as m,an as _,Y as P,y as ae,d as u,n as h,O as k,ao as B,ap as R,o as te,aa as ne,m as ie,aq as le}from"./app.fc5e7aab.js";function se(){const e=$([]);T(()=>e.value=[]);function f(l,y){e.value[y]=l}return{refs:e,updateRef:f}}const re=K({name:"VPagination",props:{activeColor:String,start:{type:[Number,String],default:1},modelValue:{type:Number,default:e=>e.start},disabled:Boolean,length:{type:[Number,String],default:1,validator:e=>e%1===0},totalVisible:[Number,String],firstIcon:{type:V,default:"$first"},prevIcon:{type:V,default:"$prev"},nextIcon:{type:V,default:"$next"},lastIcon:{type:V,default:"$last"},ariaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.root"},pageAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.page"},currentPageAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.currentPage"},firstAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.first"},previousAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.previous"},nextAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.next"},lastAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.last"},ellipsis:{type:String,default:"..."},showFirstLastPage:Boolean,...O(),...W(),...j(),...q(),...U(),...G({tag:"nav"}),...J(),...X({variant:"text"})},emits:{"update:modelValue":e=>!0,first:e=>!0,prev:e=>!0,next:e=>!0,last:e=>!0},setup(e,f){let{slots:l,emit:y}=f;const t=Y(e,"modelValue"),{t:s,n:p}=H(),{isRtl:x}=Q(),{themeClasses:C}=Z(e),I=$(-1);A(void 0,{scoped:!0});const{resizeRef:N}=ee(a=>{if(!a.length)return;const{target:n,contentRect:i}=a[0],v=n.querySelector(".v-pagination__list > *");if(!v)return;const d=i.width,b=v.offsetWidth+parseFloat(getComputedStyle(v).marginRight)*2,E=e.showFirstLastPage?5:3;I.value=Math.max(0,Math.floor(+((d-b*E)/b).toFixed(2)))}),r=m(()=>parseInt(e.length,10)),o=m(()=>parseInt(e.start,10)),c=m(()=>e.totalVisible?parseInt(e.totalVisible,10):I.value>=0?I.value:r.value),F=m(()=>{if(r.value<=0||isNaN(r.value)||r.value>Number.MAX_SAFE_INTEGER)return[];if(c.value<=1)return[t.value];if(r.value<=c.value)return _(r.value,o.value);const a=c.value%2===0,n=a?c.value/2:Math.floor(c.value/2),i=a?n:n+1,v=r.value-n;if(i-t.value>=0)return[..._(Math.max(1,c.value-1),o.value),e.ellipsis,r.value];if(t.value-v>=(a?1:0)){const d=c.value-1,b=r.value-d+o.value;return[o.value,e.ellipsis,..._(d,b)]}else{const d=Math.max(1,c.value-3),b=d===1?t.value:t.value-Math.ceil(d/2)+o.value;return[o.value,e.ellipsis,..._(d,b),e.ellipsis,r.value]}});function L(a,n,i){a.preventDefault(),t.value=n,i&&y(i,n)}const{refs:w,updateRef:D}=se();A({VPaginationBtn:{color:P(e,"color"),border:P(e,"border"),density:P(e,"density"),size:P(e,"size"),variant:P(e,"variant")}});const M=m(()=>F.value.map((a,n)=>{const i=v=>D(v,n);if(typeof a=="string")return{isActive:!1,key:`ellipsis-${n}`,page:a,props:{ref:i,ellipsis:!0,icon:!0,disabled:!0}};{const v=a===t.value;return{isActive:v,key:a,page:p(a),props:{ref:i,ellipsis:!1,icon:!0,disabled:!!e.disabled||e.length<2,elevation:e.elevation,rounded:e.rounded,color:v?e.activeColor:e.color,ariaCurrent:v,ariaLabel:s(v?e.currentPageAriaLabel:e.pageAriaLabel,n+1),onClick:d=>L(d,a)}}}})),g=m(()=>{const a=!!e.disabled||t.value<=o.value,n=!!e.disabled||t.value>=o.value+r.value-1;return{first:e.showFirstLastPage?{icon:x.value?e.lastIcon:e.firstIcon,onClick:i=>L(i,o.value,"first"),disabled:a,ariaLabel:s(e.firstAriaLabel),ariaDisabled:a}:void 0,prev:{icon:x.value?e.nextIcon:e.prevIcon,onClick:i=>L(i,t.value-1,"prev"),disabled:a,ariaLabel:s(e.previousAriaLabel),ariaDisabled:a},next:{icon:x.value?e.prevIcon:e.nextIcon,onClick:i=>L(i,t.value+1,"next"),disabled:n,ariaLabel:s(e.nextAriaLabel),ariaDisabled:n},last:e.showFirstLastPage?{icon:x.value?e.firstIcon:e.lastIcon,onClick:i=>L(i,o.value+r.value-1,"last"),disabled:n,ariaLabel:s(e.lastAriaLabel),ariaDisabled:n}:void 0}});function S(){var a;const n=t.value-o.value;(a=w.value[n])==null||a.$el.focus()}function z(a){a.key===B.left&&!e.disabled&&t.value>e.start?(t.value=t.value-1,R(S)):a.key===B.right&&!e.disabled&&t.value<o.value+r.value-1&&(t.value=t.value+1,R(S))}return ae(()=>u(e.tag,{ref:N,class:["v-pagination",C.value],role:"navigation","aria-label":s(e.ariaLabel),onKeydown:z,"data-test":"v-pagination-root"},{default:()=>[u("ul",{class:"v-pagination__list"},[e.showFirstLastPage&&u("li",{key:"first",class:"v-pagination__first","data-test":"v-pagination-first"},[l.first?l.first(g.value.first):u(h,k({_as:"VPaginationBtn"},g.value.first),null)]),u("li",{key:"prev",class:"v-pagination__prev","data-test":"v-pagination-prev"},[l.prev?l.prev(g.value.prev):u(h,k({_as:"VPaginationBtn"},g.value.prev),null)]),M.value.map((a,n)=>u("li",{key:a.key,class:["v-pagination__item",{"v-pagination__item--is-active":a.isActive}],"data-test":"v-pagination-item"},[l.item?l.item(a):u(h,k({_as:"VPaginationBtn"},a.props),{default:()=>[a.page]})])),u("li",{key:"next",class:"v-pagination__next","data-test":"v-pagination-next"},[l.next?l.next(g.value.next):u(h,k({_as:"VPaginationBtn"},g.value.next),null)]),e.showFirstLastPage&&u("li",{key:"last",class:"v-pagination__last","data-test":"v-pagination-last"},[l.last?l.last(g.value.last):u(h,k({_as:"VPaginationBtn"},g.value.last),null)])])]})),{}}}),ue={key:0,class:"text-center"},ve={__name:"Pagination",props:{pagination:{type:Object,default:null}},setup(e){const f=e,l=$(f.pagination.current_page);function y(t){le.Inertia.get(f.pagination.path,{page:t},{preserveScroll:!0,preserveState:!0})}return(t,s)=>e.pagination.last_page>1?(te(),ne("div",ue,[u(re,{modelValue:l.value,"onUpdate:modelValue":[s[0]||(s[0]=p=>l.value=p),y],class:"my-4",length:e.pagination.last_page,onPrev:s[1]||(s[1]=p=>t.$inertia.visit(e.pagination.prev_page_url)),onNext:s[2]||(s[2]=p=>t.$inertia.visit(e.pagination.next_page_url))},null,8,["modelValue","length"])])):ie("",!0)}};export{ve as _};
