.class Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;
.super Lcom/vkontakte/android/attachments/AttachmentViewHolder;
.source "WidgetAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/WidgetAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private final widgetView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p2}, Lcom/vkontakte/android/attachments/AttachmentViewHolder;-><init>(Ljava/lang/String;)V

    .line 56
    iput-object p1, p0, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;->widgetView:Landroid/view/View;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;->widgetView:Landroid/view/View;

    return-object v0
.end method
