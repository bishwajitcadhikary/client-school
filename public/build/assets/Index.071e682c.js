import y from"./Table.863cbfd7.js";import{V as o}from"./VCol.196fcba1.js";import{V as i}from"./VRow.1d74aad8.js";import{c as V,w as t,b as h,o as C,d as e,V as u,e as d,f as a,g as r,i as n,k as g,a1 as b}from"./app.ff209ba5.js";import"./Pagination.dd8e4fd9.js";import"./DataNotFound.305c8e67.js";import"./VTooltip.06926fcc.js";import"./VTable.b696833b.js";/* empty css              */const B={__name:"Index",props:{totalEarnings:{type:Number,required:!0},totalOrders:{type:Number,required:!0},totalCustomers:{type:Number,required:!0},orders:{type:Object,default:null}},setup(s){const p=b("currencyFormat");return(l,T)=>{const _=h("AppLayout");return C(),V(_,{title:l.$t("Dashboard")},{default:t(()=>[e(i,{class:"match-height"},{default:t(()=>[e(o,{cols:"12"},{default:t(()=>[e(i,{class:"match-height"},{default:t(()=>[e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Earnings")),1)]),_:1}),e(n,null,{default:t(()=>{var m,c,f;return[a(r(g(p)(s.totalEarnings,(f=(c=(m=l.$page.props)==null?void 0:m.app)==null?void 0:c.currency)==null?void 0:f.code)),1)]}),_:1})]),_:1})]),_:1}),e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Orders")),1)]),_:1}),e(n,null,{default:t(()=>[a(r(s.totalOrders),1)]),_:1})]),_:1})]),_:1}),e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Customers")),1)]),_:1}),e(n,null,{default:t(()=>[a(r(s.totalCustomers),1)]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),e(o,{cols:"12"},{default:t(()=>[e(y,{orders:s.orders},null,8,["orders"])]),_:1})]),_:1})]),_:1},8,["title"])}}};export{B as default};