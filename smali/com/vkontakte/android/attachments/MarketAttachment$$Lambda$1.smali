.class final synthetic Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/attachments/MarketAttachment;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/MarketAttachment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;->arg$1:Lcom/vkontakte/android/attachments/MarketAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/attachments/MarketAttachment;Landroid/view/View;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;-><init>(Lcom/vkontakte/android/attachments/MarketAttachment;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;->arg$1:Lcom/vkontakte/android/attachments/MarketAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/attachments/MarketAttachment;->lambda$getViewForList$0(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
