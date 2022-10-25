.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment;

.field private final arg$2:Landroid/view/inputmethod/InputMethodManager;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;Landroid/view/inputmethod/InputMethodManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;->arg$2:Landroid/view/inputmethod/InputMethodManager;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment;Landroid/view/inputmethod/InputMethodManager;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;Landroid/view/inputmethod/InputMethodManager;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;->arg$2:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->lambda$showKeyboard$0(Landroid/view/inputmethod/InputMethodManager;)V

    return-void
.end method
