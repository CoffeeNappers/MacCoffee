.class public Lcom/vkontakte/android/attachments/WidgetAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "WidgetAttachment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/WidgetAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final widget:Lcom/vkontakte/android/api/widget/Widget;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    new-instance v0, Lcom/vkontakte/android/attachments/WidgetAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/WidgetAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/WidgetAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 0
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 19
    const-class v0, Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/Widget;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    .line 20
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/WidgetAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "widget_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/widget/Widget;->getType()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 30
    .local v2, "widgetType":Ljava/lang/String;
    invoke-static {p1, v2}, Lcom/vkontakte/android/attachments/WidgetAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 31
    .local v1, "view":Landroid/view/View;
    instance-of v3, v1, Lcom/vkontakte/android/ui/widget/WidgetBinder;

    if-nez v3, :cond_0

    .line 32
    iget-object v3, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/api/widget/Widget;->createContentView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    .line 35
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 36
    .local v0, "holder":Ljava/lang/Object;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;

    if-nez v3, :cond_1

    .line 37
    new-instance v0, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;

    .end local v0    # "holder":Ljava/lang/Object;
    move-object v3, v1

    check-cast v3, Lcom/vkontakte/android/ui/widget/WidgetView;

    invoke-direct {v0, v3, v2}, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;-><init>(Landroid/view/View;Ljava/lang/String;)V

    .line 38
    .local v0, "holder":Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 41
    .end local v0    # "holder":Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;
    :cond_1
    check-cast v0, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;->access$000(Lcom/vkontakte/android/attachments/WidgetAttachment$ViewHolder;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/widget/WidgetBinder;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-interface {v3, v4}, Lcom/vkontakte/android/ui/widget/WidgetBinder;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 42
    return-object v1
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/attachments/WidgetAttachment;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 48
    return-void
.end method
