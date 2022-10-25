.class Lcom/vk/stories/CreateAndEditStoryActivity$12;
.super Landroid/os/AsyncTask;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->retrieveLocation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 625
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$12;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/location/Location;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 628
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 625
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$12;->doInBackground([Ljava/lang/Void;)Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/location/Location;)V
    .locals 2
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 633
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$12;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1302(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/location/Location;)Landroid/location/Location;

    .line 634
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$12;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1402(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/os/AsyncTask;)Landroid/os/AsyncTask;

    .line 635
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 625
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$12;->onPostExecute(Landroid/location/Location;)V

    return-void
.end method
