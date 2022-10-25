.class Lcom/vk/lists/PaginateHelper$6;
.super Ljava/lang/Object;
.source "PaginateHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/lists/PaginateHelper;->checkState()V
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
    .line 233
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$200(Lcom/vk/lists/PaginateHelper;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 237
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$400(Lcom/vk/lists/PaginateHelper;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 238
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$500(Lcom/vk/lists/PaginateHelper;)V

    .line 249
    :cond_0
    :goto_0
    return-void

    .line 240
    :cond_1
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$600(Lcom/vk/lists/PaginateHelper;)V

    goto :goto_0

    .line 242
    :cond_2
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$700(Lcom/vk/lists/PaginateHelper;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$400(Lcom/vk/lists/PaginateHelper;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 244
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$800(Lcom/vk/lists/PaginateHelper;)V

    goto :goto_0

    .line 246
    :cond_3
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$6;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$900(Lcom/vk/lists/PaginateHelper;)V

    goto :goto_0
.end method
