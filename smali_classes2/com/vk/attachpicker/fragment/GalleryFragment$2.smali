.class Lcom/vk/attachpicker/fragment/GalleryFragment$2;
.super Ljava/lang/Object;
.source "GalleryFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/fragment/GalleryFragment;->initSpinner(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field prevEntry:Lcom/vk/attachpicker/mediastore/AlbumEntry;

.field prevSelection:I

.field final synthetic this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/fragment/GalleryFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevSelection:I

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "i"    # I
    .param p4, "l"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v4, 0x0

    .line 233
    :try_start_0
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$200(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->getItem(I)Lcom/vk/attachpicker/mediastore/AlbumEntry;

    move-result-object v1

    .line 235
    .local v1, "item":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    sget-object v2, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->PHOTO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-ne v1, v2, :cond_0

    .line 236
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$300(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/CustomSpinner;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevSelection:I

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/CustomSpinner;->setSelection(I)V

    .line 237
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lcom/vk/core/util/IntentUtils;->dispatchImageIntent(Landroid/app/Fragment;I)V

    .line 257
    .end local v1    # "item":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :goto_0
    return-void

    .line 241
    .restart local v1    # "item":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_0
    sget-object v2, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->VIDEO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-ne v1, v2, :cond_1

    .line 242
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$300(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/CustomSpinner;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevSelection:I

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/CustomSpinner;->setSelection(I)V

    .line 243
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    const/4 v3, 0x3

    invoke-static {v2, v3}, Lcom/vk/core/util/IntentUtils;->dispatchVideoIntent(Landroid/app/Fragment;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 254
    .end local v1    # "item":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/Exception;
    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 247
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "item":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevEntry:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-eq v2, v1, :cond_2

    .line 248
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$400(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    move-result-object v2

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setImages(Ljava/util/ArrayList;)V

    .line 249
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->this$0:Lcom/vk/attachpicker/fragment/GalleryFragment;

    invoke-static {v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->access$100(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->scrollToPosition(I)V

    .line 252
    :cond_2
    iput p3, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevSelection:I

    .line 253
    iput-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment$2;->prevEntry:Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
