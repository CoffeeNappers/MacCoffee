.class final synthetic Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/attachments/GeoAttachment;

.field private final arg$2:Landroid/content/Context;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;->arg$1:Lcom/vkontakte/android/attachments/GeoAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;->arg$2:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/content/Context;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;-><init>(Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;->arg$1:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/GeoAttachment$$Lambda$3;->arg$2:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/attachments/GeoAttachment;->lambda$getViewForList$2(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method
