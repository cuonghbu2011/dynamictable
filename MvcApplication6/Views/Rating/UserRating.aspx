<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication6.Data.BaseEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    UserRating
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserRating</h2>

    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(true) %>

    <%
           var row = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(Model.Data);
    %>

    <fieldset>
        <legend>BaseEntity</legend>

        <div class="display-label">
            ID
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Id) %>
        </div>

        <div class="display-label">
            Category
        </div>
        <div class="display-field">
            <%: row.category_id %>
        </div>

        <div class="display-label">
            ProjectName
        </div>
        <div class="display-field">
            <%: row.project_name %>
        </div>

        <div class="display-label">
            Please entered your score:
        </div>

        <div class="display-field">
            <input name="user_score" />
        </div>

        <div class="display-label">
            Please entered your score:
        </div>

        <div class="display-field">
            <input name="user_id" />
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>

    </fieldset>

    <% } %>

    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
