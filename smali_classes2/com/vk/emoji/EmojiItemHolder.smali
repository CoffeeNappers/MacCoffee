.class final Lcom/vk/emoji/EmojiItemHolder;
.super Lcom/vk/emoji/EmojiHolder;
.source "EmojiItemHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final context:Landroid/content/Context;

.field private emojiCode:Ljava/lang/String;

.field private final emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

.field private final imageView:Lcom/vk/emoji/EmojiKeyboardImageView;

.field private final recentStore:Lcom/vk/emoji/RecentItemStore;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/emoji/RecentItemStore;Lcom/vk/emoji/EmojiKeyboardListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recentStore"    # Lcom/vk/emoji/RecentItemStore;
    .param p3, "emojiKeyboardListener"    # Lcom/vk/emoji/EmojiKeyboardListener;

    .prologue
    .line 16
    new-instance v0, Lcom/vk/emoji/EmojiKeyboardImageView;

    invoke-direct {v0, p1}, Lcom/vk/emoji/EmojiKeyboardImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vk/emoji/EmojiHolder;-><init>(Landroid/view/View;)V

    .line 17
    iput-object p1, p0, Lcom/vk/emoji/EmojiItemHolder;->context:Landroid/content/Context;

    .line 18
    iput-object p2, p0, Lcom/vk/emoji/EmojiItemHolder;->recentStore:Lcom/vk/emoji/RecentItemStore;

    .line 19
    iput-object p3, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    .line 20
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/emoji/EmojiKeyboardImageView;

    iput-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->imageView:Lcom/vk/emoji/EmojiKeyboardImageView;

    .line 21
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->imageView:Lcom/vk/emoji/EmojiKeyboardImageView;

    invoke-virtual {v0, p0}, Lcom/vk/emoji/EmojiKeyboardImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->recentStore:Lcom/vk/emoji/RecentItemStore;

    iget-object v1, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/RecentItemStore;->add(Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    iget-object v1, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiCode:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/vk/emoji/EmojiKeyboardListener;->onEmojiSelected(Ljava/lang/String;)V

    .line 35
    :cond_0
    return-void
.end method

.method public update(Ljava/lang/String;)V
    .locals 1
    .param p1, "emojiCode"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/vk/emoji/EmojiItemHolder;->emojiCode:Ljava/lang/String;

    .line 26
    iget-object v0, p0, Lcom/vk/emoji/EmojiItemHolder;->imageView:Lcom/vk/emoji/EmojiKeyboardImageView;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiKeyboardImageView;->setEmoji(Ljava/lang/String;)V

    .line 27
    return-void
.end method
