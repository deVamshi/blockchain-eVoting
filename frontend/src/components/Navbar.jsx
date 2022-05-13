import logo from "../images/logo.png";

export default function NavBar() {
  return (
    <section className="bg-amber-500">
      <div className="container p-2 justify-between items-center flex mx-auto">
        <div className="">
          <img src={logo} className="w-14" />
        </div>
      <div className="flex items-center space-x-8">
        <a href="#" className="text-white font-medium">View Results</a>
      <div className="p-2 bg-white text-slate-700 shadow-lgj rounded-md">
        <a href="#" className="font-bold">Vote Now</a>
          </div>
        </div>
      </div>
    </section>
  );
}
