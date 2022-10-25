.class Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$7;
.super Ljava/lang/Object;
.source "PhotoAlbumListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->deleteAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field final synthetic val$a:Lcom/vkontakte/android/api/PhotoAlbum;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .prologue
    .line 339
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$7;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$7;->val$a:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 342
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$7;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$7;->val$a:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$1400(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Lcom/vkontakte/android/api/PhotoAlbum;)V

    .line 343
    return-void
.end method
