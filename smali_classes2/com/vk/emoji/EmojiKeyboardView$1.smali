.class Lcom/vk/emoji/EmojiKeyboardView$1;
.super Ljava/lang/Object;
.source "EmojiKeyboardView.java"

# interfaces
.implements Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/emoji/EmojiKeyboardView;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/EmojiKeyboardView;


# direct methods
.method constructor <init>(Lcom/vk/emoji/EmojiKeyboardView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/EmojiKeyboardView;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vk/emoji/EmojiKeyboardView$1;->this$0:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSpanCountChanged(I)V
    .locals 1
    .param p1, "spanCount"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView$1;->this$0:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-static {v0}, Lcom/vk/emoji/EmojiKeyboardView;->access$000(Lcom/vk/emoji/EmojiKeyboardView;)Lcom/vk/emoji/EmojiAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView$1;->this$0:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-static {v0}, Lcom/vk/emoji/EmojiKeyboardView;->access$000(Lcom/vk/emoji/EmojiKeyboardView;)Lcom/vk/emoji/EmojiAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/emoji/EmojiAdapter;->updateRecents()V

    .line 61
    :cond_0
    return-void
.end method
