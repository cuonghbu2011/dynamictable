<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcApplication6.Data.tblUserRating>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ViewRating
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ViewRating</h2>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table>
        <tr>
            <th>ID
            </th>
            <th>UserID</th>
            <th>Score</th>
        </tr>

        <% foreach (var item in Model)
           {

               var row = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(item.Data);
        %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Id) %>
            </td>
            <td>
                <%: row.user_id %>
            </td>
            <td>
                <%: row.user_score %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
