.class Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;
.super Ljava/lang/Object;
.source "InfoFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 186
    new-instance v0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;-><init>()V

    .line 188
    .local v0, "builder":Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$600(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 189
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$600(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v1

    iget-wide v2, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$600(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v1

    iget-wide v4, v1, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->place(DD)Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    .line 197
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    const/16 v2, 0x66

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 198
    return-void

    .line 192
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$300(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$300(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->place:Lcom/vkontakte/android/GeoPlace;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$300(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->place:Lcom/vkontakte/android/GeoPlace;

    iget-wide v2, v1, Lcom/vkontakte/android/GeoPlace;->lat:D

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;->access$300(Lcom/vkontakte/android/fragments/groupadmin/InfoFragment;)Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/groups/GroupsGetSettings$Result;->place:Lcom/vkontakte/android/GeoPlace;

    iget-wide v4, v1, Lcom/vkontakte/android/GeoPlace;->lon:D

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->place(DD)Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    goto :goto_0
.end method
