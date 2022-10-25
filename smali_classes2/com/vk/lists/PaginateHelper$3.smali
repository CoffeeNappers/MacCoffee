.class Lcom/vk/lists/PaginateHelper$3;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Lcom/vk/lists/OnRetryClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper;->bind(Lcom/vk/lists/PaginateHelper$PaginatedView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginateHelper;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$3;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRetryClick()V
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$3;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v0}, Lcom/vk/lists/PaginateHelper;->reload()V

    .line 105
    return-void
.end method
