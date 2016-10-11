<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcApplication6.Data.tblRatingCategories>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table>
        <tr>
            <th>ID</th>
            <th>project name</th>
            <th>category_id</th>
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
                <%: row.project_name%>
            </td>
            <td>
                <%: row.category_id%>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("User Rating", "UserRating", new { id = item.Id }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
