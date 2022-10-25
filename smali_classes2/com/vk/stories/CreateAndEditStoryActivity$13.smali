.class Lcom/vk/stories/CreateAndEditStoryActivity$13;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 653
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$13;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 656
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$13;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    div-int/lit16 v1, v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/EditorAnalytics;->length(I)V

    .line 657
    return-void
.end method
