.class Lcom/android/camera/component/HdrUI$7;
.super Ljava/lang/Object;
.source "HdrUI.java"

# interfaces
.implements Lcom/android/camera/IEventHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/component/HdrUI;->registerListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/component/HdrUI;


# direct methods
.method constructor <init>(Lcom/android/camera/component/HdrUI;)V
    .locals 0
    .parameter

    .prologue
    .line 324
    iput-object p1, p0, Lcom/android/camera/component/HdrUI$7;->this$0:Lcom/android/camera/component/HdrUI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEvent(Lcom/android/camera/Event;)V
    .locals 2
    .parameter "event"

    .prologue
    const/4 v1, 0x0

    .line 327
    iget-object v0, p0, Lcom/android/camera/component/HdrUI$7;->this$0:Lcom/android/camera/component/HdrUI;

    #calls: Lcom/android/camera/component/HdrUI;->showIndicator(ZZ)V
    invoke-static {v0, v1, v1}, Lcom/android/camera/component/HdrUI;->access$100(Lcom/android/camera/component/HdrUI;ZZ)V

    .line 328
    return-void
.end method